{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";         # Remove anything not declared here
      upgrade = true;
    };

    # GUI apps shared across all machines
    casks = [
      "ghostty"
      "1password"
      "1password-cli"
      "hammerspoon"
      "claude"                 # Claude desktop app
      "claude-code"            # Claude Code CLI (auto-updates via cask)
    ];

    # CLI tools from Homebrew (only if not in nixpkgs)
    brews = [
    ];

    # Mac App Store apps (requires mas CLI and App Store sign-in)
    masApps = {
      # "Xcode" = 497799835;
    };
  };
}
