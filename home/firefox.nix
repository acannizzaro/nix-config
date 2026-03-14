{pkgs, ... }:



{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFormHistory = true;
      DontCheckDefaultBrowser = true;
      HttpsOnlyMode = "force_enabled";
      PasswordManagerEnabled = false;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;

      SearchEngines = {
        Default = "DuckDuckGo";
        Remove = [ "Google" "Bing" "Amazon.com" "eBay" "Wikipedia (en)" ];
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          default_area = "navbar";
        };
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          default_area = "navbar";
        };
      };

      EnableTrackingProtection = {
        Value = true;
        Locked = false;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      Cookies = {
        Behavior = "reject-foreign";
        BehaviorPrivateBrowsing = "reject";
      };

      DNSOverHTTPS = {
        Enabled = true;
        ProviderURL = "https://mozilla.cloudflare-dns.com/dns-query";
        Locked = false;
      };

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };

      UserMessaging = {
        WhatsNew = false;
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
      };

      OverridePostUpdatePage = "";
      OverrideFirstRunPage = "";
    };

    profiles.default = {
      isDefault = true;
      settings = {
        # AI / ML features — all disabled
        "browser.ai.chat.enabled" = false;
        "browser.ai.chat.sidebar" = false;
        "browser.ai.chat.shortcut.enabled" = false;
        "browser.ai.inferenceEnabled" = false;
        "browser.ml.chat.enabled" = false;
        "browser.ml.chat.sidebar" = false;
        "browser.ml.chat.shortcut.enabled" = false;
        "browser.ml.chat.provider" = "";
        "browser.ml.chat.prompt.prefix" = "";
        "browser.ml.enable" = false;
        "browser.translations.enable" = false;
        "browser.urlbar.quicksuggest.ai" = false;
        "browser.search.suggest.ai" = false;

        # Privacy hardening
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;

        # Telemetry
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "browser.ping-centre.telemetry" = false;

        # Experiments
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        # Pocket
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.site" = "";

        # Sponsored content
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

        # Home content
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;

        # Firefox suggest
        "browser.urlbar.suggest.engines" = false;

        # Passwords — never save
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;
        "signon.management.page.breach-alerts.enabled" = false;
        "signon.generation.enabled" = false;
        "signon.firefoxRelay.feature" = "";

        # Payment info — never save or autofill
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "dom.payments.defaults.saveAddress" = false;
        "dom.payments.defaults.saveCreditCard" = false;

        # HTTPS-only
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;

        # Disable prefetching
        "network.prefetch-next" = false;
        "network.dns.disablePrefetch" = true;
        "network.predictor.enabled" = false;
        "network.http.speculative-parallel-limit" = 0;

        # Block location and notification by default
        "permissions.default.geo" = 2;
        "permissions.default.desktop-notification" = 2;

        # Web compat / fix major site issues
        "extensions.webcompat.enable_shims" = true;
        "privacy.antitracking.enableWebcompat" = true;

        # UI
        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;
        "browser.tabs.inTitlebar" = 1;
        "browser.compactmode.show" = true;
      };
    };
  };
}
