{ ... }:

{
  system.defaults = {

    # ── Dock ──────────────────────────────────────────────────────────
    dock = {
      autohide = false;
      minimize-to-application = true;
      show-recents = false;
      tilesize = 128;
      expose-group-apps = true;

      # Hot corners — all disabled
      wvous-tl-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
    };

    # ── Finder ────────────────────────────────────────────────────────
    finder = {
      AppleShowAllExtensions = true;
      ShowStatusBar = false;
      ShowPathbar = false;
      FXPreferredViewStyle = "clmv";
      ShowExternalHardDrivesOnDesktop = true;
      ShowHardDrivesOnDesktop = false;
      ShowRemovableMediaOnDesktop = true;
    };

    # ── Global Preferences ────────────────────────────────────────────
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      NSAutomaticCapitalizationEnabled = true;
      NSAutomaticPeriodSubstitutionEnabled = true;
      "com.apple.trackpad.forceClick" = true;
      "com.apple.trackpad.scaling" = 0.875;
    };

    # ── Trackpad ──────────────────────────────────────────────────────
    trackpad = {
      Clicking = false;
      TrackpadRightClick = false;
    };

    # ── Screenshots ───────────────────────────────────────────────────
    screencapture = {
      location = "~/Screenshots";
      type = "png";
    };

    # ── Menu Bar Clock ────────────────────────────────────────────────
    menuExtraClock = {
      IsAnalog = false;
      ShowAMPM = true;
      ShowDate = 0;
      ShowDayOfWeek = true;
    };

    # ── Custom Preferences ────────────────────────────────────────────
    # Options that don't have first-class nix-darwin module support
    CustomUserPreferences = {
      NSGlobalDomain = {
        AppleMiniaturizeOnDoubleClick = false;
        NSTableViewDefaultSizeMode = 1;
        "com.apple.sound.beep.feedback" = 1;
        "com.apple.springing.enabled" = true;
        "com.apple.springing.delay" = 0.5;
      };
      "com.apple.AppleMultitouchTrackpad" = {
        TrackpadCornerSecondaryClick = 2;
      };
      "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
        TrackpadCornerSecondaryClick = 2;
      };
      "com.apple.WindowManager" = {
        GloballyEnabled = false;
        EnableTiledWindowMargins = false;
        HideDesktop = true;
      };
      "org.hammerspoon.Hammerspoon" = {
        MJAutoLaunchKey = true;
        MJShowMenuIconKey = true;
      };
    };
  };
}
