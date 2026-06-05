{
  config.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = true;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix = {
        enable = true;
        format.type = [ "nixfmt" ];
      };

      html.enable = true;
      css.enable = true;
      json.enable = true;
      typescript.enable = true;
    };

    diagnostics = {
      enable = true;
      config.virtual_text = true;
    };

    autocomplete.blink-cmp.enable = true;
  };
}
