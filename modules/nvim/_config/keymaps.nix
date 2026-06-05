{
  config.vim = {
    globals.mapleader = " ";

    binds.whichKey.enable = true;

    keymaps = [
      {
        key = "<C-d>";
        mode = [ "n" ];
        action = "<C-d>zz";
      }
      {
        key = "<C-u>";
        mode = [ "n" ];
        action = "<C-u>zz";
      }
      {
        key = "n";
        mode = [ "n" ];
        action = "nzzzv";
      }
      {
        key = "N";
        mode = [ "n" ];
        action = "Nzzzv";
      }
      {
        key = "p";
        mode = [ "x" ];
        action = "\"_dP";
      }
      {
        key = "d";
        mode = [ "n" ];
        action = "\"_d";
      }
      {
        key = "d";
        mode = [ "v" ];
        action = "\"_d";
      }
    ];
  };
}
