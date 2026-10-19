{ config, lib, pkgs, inputs, ... }:

{
  imports = [
  ];

  home.username = "vojta";
  home.homeDirectory = "/home/vojta";

  programs.git = {
    enable = true;
    userName = "Meywy";
    userEmail = "meywyy@gmail.com";
  };

  home.stateVersion = "26.05";

  home.sessionVariables = {
    GITHUB_TOKE = "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";
  };

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      height = 36;
      margin-top = 6;
      margin-left = 10;
      margin-right = 10;
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "pulseaudio" "network" "cpu" "memory" "disk" "clock" ];
      
      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        format = "{name}";
      };
      
      clock = {
        format = "Time: {:%H:%M}";
        format-alt = "Date: {:%Y-%m-%d}";
      };
      
      cpu = {
        format = "CPU: {usage}%";
        interval = 5;
      };
      
      memory = {
        format = "RAM: {}%";
        interval = 5;
      };

      disk = {
        format = "Disk: {percentage_used}%";
        interval = 30;
      };
      
      network = {
        format-wifi = "WiFi: {signalStrength}%";
        format-ethernet = "Wired";
        format-disconnected = "Offline";
      };
      
      pulseaudio = {
        format = "Vol: {volume}%";
        format-muted = "Muted";
      };
    }];
    
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        font-weight: bold;
        border-radius: 8px;
      }

      window#waybar {
        background: transparent;
        color: #abb2bf;
      }

      #workspaces {
        background: #21252b;
        margin: 4px 4px;
        padding: 0 4px;
        border: 1px solid #3e4451;
      }

      #workspaces button {
        padding: 0 8px;
        color: #5c6370;
        background: transparent;
      }

      #workspaces button.focused {
        color: #61afef;
        background: #2c313a;
      }

      #window {
        background: #21252b;
        padding: 0 12px;
        margin: 4px 0;
        color: #98c379;
        border: 1px solid #3e4451;
      }

      #clock, #cpu, #memory, #disk, #network, #pulseaudio {
        background: #21252b;
        padding: 0 12px;
        margin: 4px 3px;
        color: #e5c07b;
        border: 1px solid #3e4451;
      }

      #network { color: #61afef; }
      #pulseaudio { color: #c678dd; }
      #memory { color: #98c379; }
      #disk { color: #56b6c2; }
      #cpu { color: #e06c75; }
    '';
  };

  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font 13";
    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{name}";
      sidebar-mode = false;
      display-drun = "";
    };
    theme = builtins.toFile "rofi-theme" ''
      * {
        background-color: #21252b;
        text-color: #abb2bf;
        border-color: #3e4451;
      }

      window {
        width: 500px;
        border: 1px;
        border-radius: 8px;
        padding: 10px;
      }

      inputbar {
        padding: 8px;
        border: 1px;
        border-radius: 6px;
        margin: 0px 0px 10px 0px;
      }

      prompt {
        text-color: #61afef;
      }

      entry {
        text-color: #abb2bf;
        placeholder: "Search applications...";
        placeholder-color: #5c6370;
      }

      listview {
        lines: 8;
        columns: 1;
        scrollbar: false;
      }

      element {
        padding: 8px;
        border-radius: 6px;
      }

      element selected {
        background-color: #2c313a;
        text-color: #61afef;
      }
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 13.0;
      };
      window = {
        padding = {
          x = 12;
          y = 12;
        };
        opacity = 0.85;
      };
      colors = {
        primary = {
          background = "#21252b";
          foreground = "#abb2bf";
        };
        cursor = {
          text = "#21252b";
          cursor = "#528bff";
        };
        normal = {
          black = "#1e222a";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#abb2bf";
        };
        bright = {
          black = "#5c6370";
          red = "#e06c75";
          green = "#98c379";
          yellow = "#e5c07b";
          blue = "#61afef";
          magenta = "#c678dd";
          cyan = "#56b6c2";
          white = "#ffffff";
        };
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    checkConfig = false;
    config = {
      input."*" = {
        xkb_layout = "us,cz";
      };
      modifier = "Mod4";

      bars = [ { command = "${pkgs.waybar}/bin/waybar"; } ];

      terminal = "${pkgs.alacritty}/bin/alacritty";

      output."*" = {
        bg = "/home/vojta/Config/config/wallpapers/wallpaper_one.jpg fill";
      };

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
        "${modifier}+space" = "exec swaymsg input type:keyboard xkb_switch_layout next";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";
        "${modifier}+Shift+s" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | tee /home/vojta/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | ${pkgs.wl-clipboard}/bin/wl-copy";
      };
      
    };
  };

  home.packages = with pkgs; [
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    prismlauncher
    vesktop
    jetbrains.idea
    jetbrains.goland
    bun
    waybar
    rofi
    swaybg
    clang-tools
    go
    gopls
    osu-lazer
    opentabletdriver
    grim
    slurp
    wl-clipboard
    jdk25
    gradle
    inputs.opencode.packages.${pkgs.system}.default
  ];
}
