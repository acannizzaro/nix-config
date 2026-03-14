{ pkgs, ... }:

{
  networking.hostName = "personal-mbp";
  networking.computerName = "Anthony's MacBook Pro";

  # Personal-only Homebrew casks
  homebrew.casks = [
    "steam"
    "league-of-legends"
    "rustrover"
  ];
}
