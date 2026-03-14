{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Symlink init.lua from this repo
  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/colors".source = ./nvim/colors;

  # All external tools Neovim expects — replaces Mason
  home.packages = with pkgs; [
    # LSP servers
    terraform-ls
    bash-language-server
    marksman
    vscode-langservers-extracted       # jsonls, cssls, html-lsp
    yaml-language-server
    lua-language-server

    # Formatters
    shfmt
    stylua
    nodePackages.prettier

    # Linters
    shellcheck
    tflint
    nodePackages.markdownlint-cli

    # Tools Neovim plugins need
    jq                                  # conform.nvim JSON formatter
    tree-sitter                         # Treesitter parser compilation
    gcc                                 # C compiler for parsers
    nodejs                              # markdown-preview.nvim
  ];
}
