{ inputs, ... }:

{
  perSystem =
    {
      config,
      self',
      pkgs,
      system,
      ...
    }:
    let
      unfreePkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.default = pkgs.mkShell {
        name = "mern-devShell";

        packages = [
          self'.packages.nvim
          pkgs.nodejs_24
          unfreePkgs.mongodb-ce
          unfreePkgs.mongosh
        ];

        shellHook = ''
          DATA_DIR="$PWD/.data"
          DB_DIR="$DATA_DIR/db"
          LOG_FILE="$DATA_DIR/mongodb.log"
          PID_FILE="$DATA_DIR/mongod.pid"
          LOCK_FILE="$DB_DIR/mongod.lock"

          mkdir -p "$DB_DIR"

          # Fallback: Check if the process is actually running
          PROCS=$(pgrep -u "$USER" -x mongod)

          if [ -z "$PROCS" ]; then
            # No live mongod process exists: sweep away all stale locks and PIDs
            rm -f "$PID_FILE"
            rm -f "$LOCK_FILE"
          fi

          # Start daemon now that environment lock files are verified clean
          if [ ! -f "$PID_FILE" ]; then
            mongod --dbpath "$DB_DIR" --logpath "$LOG_FILE" --fork --pidfilepath "$PID_FILE" >/dev/null 2>&1
            echo "DB started and logged at $LOG_FILE"
          fi

          cleanup_mongodb() {
            if [ -f "$PID_FILE" ]; then
              PID=$(cat "$PID_FILE")
              if kill -0 $PID 2>/dev/null; then
                echo "Terminating DB."
                kill $PID
                while kill -0 $PID 2>/dev/null; do sleep 0.1; done
              fi
              rm -f "$PID_FILE"
              rm -f "$LOCK_FILE"
            fi
          }

          trap cleanup_mongodb EXIT INT HUP TERM
        '';
      };
    };
}
