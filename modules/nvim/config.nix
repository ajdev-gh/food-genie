{ self, inputs, ... }:
{
  perSystem =
    { config, pkgs, ... }:
    {
      packages.nvim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [ (inputs.import-tree ./_config) ];
        }).neovim;
    };
}
