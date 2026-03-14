{ hostname, ... }:

let
  emailMap = {
    "personal-mbp" = "67709553+acannizzaro@users.noreply.github.com";
    "work-mbp" = "anthony@company.com";
  };
in
{
  programs.git = {
    enable = true;

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINJpg4z09PYNHg3nyO1cOG5DNLmkhp3ZqIwk6kZGbqnq";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "acannizzaro";
        email = emailMap.${hostname} or "67709553+acannizzaro@users.noreply.github.com";
      };
      gpg.format = "ssh";
      "gpg.ssh".allowedSignersFile = "~/.config/git/allowed_signers";
      "gpg.ssh".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rerere.enabled = true;
      core.editor = "nvim";
    };

    ignores = [
      ".DS_Store"
      ".direnv"
      "result"
      "result-*"
    ];
  };

  xdg.configFile."git/allowed_signers".text = ''
    67709553+acannizzaro@users.noreply.github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINJpg4z09PYNHg3nyO1cOG5DNLmkhp3ZqIwk6kZGbqnq
  '';

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        extraOptions = {
          IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
          AddKeysToAgent = "yes";
          UseKeychain = "yes";
        };
      };
    };
  };
}
