{ pkgs, fenixPkgs, ... }:

let
  rustToolchain = fenixPkgs.stable.withComponents [
    "cargo"
    "clippy"
    "rust-analyzer"
    "rust-src"
    "rust-std"
    "rustc"
    "rustfmt"
  ];
in
{
  home.packages = with pkgs; [
    # Rust — complete toolchain from fenix
    rustToolchain

    # Python
    python312
    uv
    ruff
    ty

    # Nix development
    nil
    nixfmt
  ];
}
