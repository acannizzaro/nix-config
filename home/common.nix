{ pkgs, hostname, agenixPkgs, ... }:

{
  imports = [
    ./shell.nix
    ./git.nix
    ./editor.nix
    ./dev.nix
    ./scripts.nix
    ./firefox.nix
    ./fastfetch.nix
    ./claude-code.nix
    ./gh.nix
  ];

  home.stateVersion = "24.05";

  home.packages = (with pkgs; [
    ripgrep
    fastfetch
    fd
    gh
    jq
    bat
    eza
    fzf
    delta
    htop
    tmux
    tokei
    tree
    wget
    curl
    age
  ]) ++ [
    agenixPkgs.default
  ];

  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
      pager = "never";
    };
  };

  # Ghostty config (binary installed via Homebrew cask)
  xdg.configFile."ghostty/config".text = ''
    font-family = Hack Nerd Font
    font-size = 13
    cursor-style = underline
    theme = Synthwave
    copy-on-select = clipboard
    macos-option-as-alt = true
  '';

  # Hammerspoon config (binary installed via Homebrew cask)
  home.file.".hammerspoon/init.lua".source = ./hammerspoon/init.lua;
}
