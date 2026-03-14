{ ... }:

{
  home.file.".claude/settings.json".text = builtins.toJSON {
    permissions = {
      defaultMode = "default";
      disableBypassPermissionsMode = "disable";

      allow = [
        # Git
        "Bash(git *)"

        # GitHub CLI
        "Bash(gh pr *)"
        "Bash(gh issue *)"
        "Bash(gh repo view *)"
        "Bash(gh repo clone *)"
        "Bash(gh browse *)"
        "Bash(gh status *)"
        "Bash(gh run *)"
        "Bash(gh workflow *)"
        "Bash(gh api *)"
        "Bash(gh search *)"
        "Bash(gh gist *)"

        # Nix / system
        "Bash(nix *)"
        "Bash(darwin-rebuild *)"
        "Bash(direnv *)"
        "Bash(home-manager *)"

        # Cargo — safe operations
        "Bash(cargo build *)"
        "Bash(cargo run *)"
        "Bash(cargo test *)"
        "Bash(cargo check *)"
        "Bash(cargo clippy *)"
        "Bash(cargo fmt *)"
        "Bash(cargo init *)"
        "Bash(cargo clean *)"
        "Bash(cargo doc *)"
        "Bash(cargo bench *)"
        "Bash(cargo update *)"

        # Rust tools
        "Bash(rustc *)"
        "Bash(clippy-driver *)"
        "Bash(rustfmt *)"

        # uv — safe operations
        "Bash(uv run *)"
        "Bash(uv sync *)"
        "Bash(uv venv *)"
        "Bash(uv lock *)"
        "Bash(uv run pytest *)"
        "Bash(uv run python -m pytest *)"
        "Bash(pytest *)"

        # Python / linting
        "Bash(ruff *)"
        "Bash(python *)"

        # Terraform / OpenTofu
        "Bash(tofu *)"

        # Safe CLI tools
        "Bash(cat *)"
        "Bash(bat *)"
        "Bash(ls *)"
        "Bash(eza *)"
        "Bash(find *)"
        "Bash(fd *)"
        "Bash(rg *)"
        "Bash(grep *)"
        "Bash(sed *)"
        "Bash(awk *)"
        "Bash(sort *)"
        "Bash(head *)"
        "Bash(tail *)"
        "Bash(wc *)"
        "Bash(echo *)"
        "Bash(printf *)"
        "Bash(mkdir *)"
        "Bash(cp *)"
        "Bash(mv *)"
        "Bash(touch *)"
        "Bash(which *)"
        "Bash(env *)"
        "Bash(basename *)"
        "Bash(dirname *)"
        "Bash(realpath *)"
        "Bash(jq *)"
        "Bash(tokei *)"
        "Bash(diff *)"
        "Bash(tee *)"

        # Read-only file access
        "Read"
      ];

      ask = [
        # Package additions — always prompt
        "Bash(cargo add *)"
        "Bash(cargo install *)"
        "Bash(cargo remove *)"
        "Bash(uv add *)"
        "Bash(uv remove *)"
        "Bash(uv pip install *)"
        "Bash(uv pip uninstall *)"
        "Bash(npm install *)"
        "Bash(npm uninstall *)"
        "Bash(nix profile install *)"
        "Bash(gh repo delete *)"
        "Bash(gh pr merge *)"
        "Bash(gh pr close *)"
        "Bash(gh issue close *)"
      ];

      deny = [
        # Destructive
        "Bash(rm -rf /)"
        "Bash(rm -rf ~)"
        "Bash(rm -rf /*)"
        "Bash(sudo rm *)"
        "Bash(sudo chmod *)"
        "Bash(sudo chown *)"

        # Dangerous downloads
        "Bash(curl * | bash)"
        "Bash(curl * | sh)"
        "Bash(wget * | bash)"
        "Bash(wget * | sh)"

        # Secrets
        "Read(.env)"
        "Read(.env.*)"
        "Read(**/.env)"
        "Read(**/.env.*)"
        "Read(**/*.pem)"
        "Read(**/*.key)"
        "Read(**/id_rsa)"
        "Read(**/id_ed25519)"
      ];
    };

    # Effort level
    effortLevel = "high";

    # Environment
    env = {
      DISABLE_TELEMETRY = "1";
      DISABLE_ERROR_REPORTING = "1";
      CLAUDE_CODE_DISABLE_BACKGROUND_TASKS = "1";
    };

    # Transcript cleanup
    cleanupPeriodDays = 90;

    # Auto-updates
    autoUpdatesChannel = "stable";

    # Attribution
    attribution = {
      commits = true;
      pullRequests = true;
    };
  };
}
