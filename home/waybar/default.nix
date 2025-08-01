{ pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      waybar = {
        layer = "top";
        position = "top";
        height = 42;
        spacing = 4;
        margin-left = 14;
        margin-right = 14;
        margin-top = 2;
        modules-left = [ "custom/nixos" "hyprland/workspaces" "mpris" "cava" ];
        modules-center = [ "clock" "hyprland/window" ];
        modules-right = [ "pulseaudio" "cpu" "memory" "temperature" "network" "battery" "tray" ];

        # NixOS logo
        "custom/nixos" = {
          format = "";
          on-click = "sh -c \"$HOME/.config/hypr/Scripts/WallPaper.zsh\"";
        };
 
        "mpris" = {
          "format" = "♪ « {artist} - {title} »";
          "format-paused" = "⏸ [{artist} - {title}]";
          "max-length" = 50;
        };

        # Workspace
        "hyprland/workspaces" = {
          format = "{icon}"; 
          "format-icons" = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
            sort-by-number = false;
          };
          show-empty = false;
        };

        # Centered
        "hyprland/window" = {
          format = "{}";
	        max-length = 25;
          separate-outputs = false;
          rewrite = {
            "" = "/ᐠ - ˕ -マ Ⳋ ⋆｡°✩♬ ♪";
          };
        };
        
        # On screen thingy
        cava = {
          framerate = 240;
          autosens = 1;
          sensitivity = 5;
          bars = 6;
          lower_cutoff_freq = 20;
          higher_cutoff_freq = 22000;
          method = "pipewire";
          source = "auto";
          stereo = false;
          reverse = false;
          bar_delimiter = 0;
          monstercat = true;
          waves = true;
          noise_reduction = 0.77;
          input_delay = 0;
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        # Volume Control
        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}%  {format_source}";
          format-bluetooth-muted = "{icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
          "tooltip" = true;
        };

        # Clock
        clock = {
            format = "{:%H:%M}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
        };

        # Cpu
        cpu = {
            interval = 1;
            format = " {usage}%";
        };

        # Memory
        memory = {
          interval = 1;
          format = " {}%";
          tooltip = true;
        };

        # Temperature
        temperature = {
            interval = 10;
            critical-threshold = 100;
            format-critical = " {temperatureC}";
            format = " {temperatureC}°C";
        };

        # Network
        network = {
          format-disconnected = "󰯡 Disconnected";
          format-ethernet = "{bandwidthUpBytes} {bandwidthDownBytes} 󰒢 Connected!";
          format-linked = "󰖪 {essid} (No IP)";
          format-wifi = "󰖩 {essid}";
          min-width = 20;
          fixed-width = 20;
          interval = 1;
          tooltip = false;
        };

        # Battery
        battery = {
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{icon} {capacity}%";
            format-full = "{icon} {capacity}%";
            format-charging = " {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{time} {icon}";
            format-icons = [
                ""
                ""
                ""
                ""
                ""
            ];
        };

        "tray" = {
          icon-size = 12;
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: "FiraCode Nerd Font Mono";
        font-size: 13px;
        font-weight: bold;
        min-height: 8px;
        color: #f5e0dc;
      }

      window#waybar {
        background: transparent;
        margin: 0px;
        padding: 0px;
      }

      #workspaces {
        margin-left: 8px;
      }

      #workspaces button {
        padding: 0 3px;
        box-shadow: none;
        background-color: transparent;
      }

      #workspaces button.active {
        box-shadow: none;
        color: #e0def4;
        font-weight: 900;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        border: 2.5px solid rgba(196, 167, 231, 0.2);
        border-radius: 12px;
        margin: 4px 20px;
        padding: 2px 5px;
        background: rgba(57, 53, 82, 0.75);
      }

      #hyprland-window {
        font-weight: bold;
        color: #f6c177;
      }

      #custom-nixos {
        font-size: 14px;
        padding-left: 5px;
      }

      #mpris {
        padding-left: 5px;
        padding-right: 0px;
      }

      #mpris {
        color: #f2e9de;
      }

      #cava {
        font-family: monospace;
        color: #eb6f92;
      }

      #clock {
        color: #e0def4;
        padding: 0 10px;
      }

      #battery {
        color: #f6c177;
        padding: 0 10px;
      }
      #cpu {
        color: #9ccfd8;
        padding: 0 10px;
      }

      #memory {
        color: #c4a7e7;
        padding: 0 10px;
      }

      #temperatureC {
        color: #eb6f92;
        padding: 0 10px;
      }

      #network {
        color: #31748f;
        padding: 0 10px;
      }

      #pulseaudio {
        color: #f6c177;
        padding: 0 10px;
      }

      #tray {
        padding: 0 10px;
      }

      #mpris:hover,
      #clock:hover,
      #battery:hover,
      #cpu:hover,
      #memory:hover,
      #temperature:hover,
      #network:hover,
      #pulseaudio:hover,
      #tray:hover {
        background: rgba(26, 27, 38, 0.9);
      }
    '';
  };
}
