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
      };
    };
}
