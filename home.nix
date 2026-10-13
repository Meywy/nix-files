{ config, pkgs, ... }:

{
  home.username = "vojta";
  home.homeDirectory = "/home/vojta";
  programs.git = {
    enable = true;
    userName = "Meywy";
    userEmail = "meywyy@gmail.com";
  };
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "nixos wow, btw";
    };
  };

  home.file.".config/nvim".source = ./config/nvim;

  home.packages = with pkgs; [
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    prismlauncher
    vesktop
    jetbrains.idea
  ];
}
