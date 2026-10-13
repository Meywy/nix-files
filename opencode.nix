{ pkgs, inputs, ... }:

let
  opencodePkg = inputs.opencode-flake.packages.${pkgs.system}.default;
in
{
  home.packages = with pkgs; [
    opencodePkg
    bun
  ];

  home.file.".config/opencode".source = ./config/opencode;
}
