{ pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      waybar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 4;
        margin-left = 14;
        margin-right = 14;
        margin-top = 2;
        modules-left = [ "custom/nixos" "hyprland/workspaces" ];
        modules-center = [ "clock" "hyprland/window" ];
        modules-right = [
	      "cava"
	      "pulseaudio"
        "cpu"
	      "memory"
        "temperature"
        "network"
	      "battery"
	      "tray"
        ];

        # NixOS logo
        "custom/nixos" = {
          format = "";
          tooltip = true;
          tooltip-format = "btw";
        };

        mpris = {
          format = "♪ « {artist} - {title} »";
          format-paused = "⏸ [{artist} - {title}]";
          max-length = 50;
        };

        # Workspace
        "hyprland/workspaces" = {
          format = "{icon}";
          tooltip = false;
	        show-empty = false;

	        format-icons = {
	          active = "●";
            visible = "●"; # visible but not focused ( e.g on other monitor )
	          default = "○"; # has windows, not active
	          empty = ""; # don't show at allvi
	        };
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
          format-ethernet = "󰒢 Connected!";
          format-linked = "󰖪 {essid} (No IP)";
          format-wifi = "󰖩 {essid}";
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

        # Clock
        clock = {
            format = "{:%H:%M}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
        };
      };
    };

    style = ''
      * {
        font-family: "FiraCode Nerd Font Mono";
        font-weight: bold;
        font-size: 14px;
        color: #f5e0dc;
      }

      window#waybar {
        background: none;
        border: none;
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
        color: #f6c177;
        font-weight: 900;
      }

      .modules-left,
      .modules-right {
        border: 2.5px solid rgba(196, 167, 231, 0.2);
        border-radius: 12px;
        margin: 4px 20px;
        padding: 2px 5px;
        background: rgba(57, 53, 82, 0.75);
      }

      .modules-center {
        border: none;
        background: none;
      }

      #hyprland-window {
        font-weight: bold;
        color: #f6c177;
      }

      #custom-nixos {
        font-size: 18px;
        padding-left: 10px;
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
