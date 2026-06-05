{
  config.vim = {
    ui = {
      ui2.enable = true;
    };
    hideSearchHighlight = true;

    statusline.lualine.enable = true;

    visuals.nvim-web-devicons.enable = true;

    mini = {
      files.enable = true;
    };

    keymaps = [
      {
        key = "<leader>e";
        mode = [ "n" ];
        action = "<cmd>lua MiniFiles.open()<CR>";
        desc = "File explorer";
      }
    ];
  };
}
