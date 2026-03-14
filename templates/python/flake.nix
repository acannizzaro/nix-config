{
  description = "Python project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            python314
            uv
            ruff
	        ty
          ];
          shellHook = ''
            export UV_PROJECT_ENVIRONMENT=.venv
            if [ ! -d .venv ] || [ "$(readlink -f .venv/bin/python3)" != "$(which python3)" ]; then
              uv venv --clear --python $(which python3)
            fi
            source .venv/bin/activate
          '';
        };
      });
}
