{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    jdk25
    osu-lazer
    opentabletdriver
    protonup-qt
    lutris
    gamescope
    mangohud
    goverlay
  ];

  hardware.opentabletdriver.enable = true;
  services.flatpak.enable = true;
}
