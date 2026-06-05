{ self, inputs, ... }:

{
  perSystem = { config, self', pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      meta.description = "MERN stack development environment";

      packages = with pkgs; [
        self'.packages.nvim
      ];
    };
  };
}
