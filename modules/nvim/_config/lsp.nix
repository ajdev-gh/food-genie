{
  config.vim = {
    lsp = {
      enable = true;
      lspkind.enable = true;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
    };

    diagnostics = {
      enable = true;
      config.virtual_text = true;
    };

    autocomplete.blink-cmp.enable = true;
  };
}
