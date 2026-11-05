{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nixd
    alejandra
    clang-tools
    lua-language-server
    typescript-language-server
    rust-analyzer
    gopls
    deno
    rustc
    cargo
    gradle
    go
    bun
    jetbrains.idea
    jetbrains.goland
    gcc
    nodejs
  ];
}
