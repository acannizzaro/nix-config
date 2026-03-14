{ pkgs, ... }:

{
  # Default shell
  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];

  # Timezone
  time.timeZone = "America/Los_Angeles";

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
  ];
}
