{
  config.vim = {
    mini = {
      pick.enable = true;
      extra.enable = true;
    };

    keymaps = [
      {
        key = "<leader>ff";
        mode = [ "n" ];
        action = "<cmd>Pick files<CR>";
        desc = "Find files";
      }
      {
        key = "<leader>fg";
        mode = [ "n" ];
        action = "<cmd>Pick grep_live<CR>";
        desc = "Find by grep";
      }
      {
        key = "<leader>fb";
        mode = [ "n" ];
        action = "<cmd>Pick buffers<CR>";
        desc = "Find buffers";
      }
      {
        key = "<C-f>";
        mode = [ "n" ];
        action = "<cmd>Pick files tool='git'<CR>";
        desc = "Find git files";
      }
    ];
  };
}
