{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      waybar = {
        layer = "top";
        position = "top";
        modules-left = [ "custom/nixos" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
	      "cava"
	      "pulseaudio"
	      "network"
              "cpu"
	      "memory"
	      "disk"
	      "temperature"
	      "battery"
	      "clock"
	      "tray"
        ];

        # NixOS logo
        "custom/nixos" = {
          format = "";
          tooltip = true;
          tooltip-format = "btw";
        };

        # Workspace
        "hyprland/workspaces" = {
          on-click = "activate";
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
	      max-length = 80;
	      separate-outputs = true;
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

        # Network
        network = {
	    format = "{icon}";
            format-wifi = "{icon} {essid}";
            format-ethernet = "{icon} connected";
            tooltip-format = "{ifname} via {gwaddr}";
            format-linked = "{icon}{ ifname} (No IP)";
            format-disconnected = "Disconnected ⚠";

	    format-icons = {
	      wifi = "󰖩";
	      ethernet = "󰈁";
	      linked = "󰈂";
	    };
            # on-click = "sh ~/scripts/rofi-wifi-menu/rofi-wifi-menu.sh";
        };

        # Cpu
        cpu = {
            format = " {usage}%";
            tooltip = true;
        };

        # Memory
	    memory = {
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
	color: #e0def4;
      }

      window#waybar {
        background: rgba(24, 23, 37, 0.8);
        border: none;
      }

      #workspaces button {
        padding: 0 5px;
        border: none;
        background-color: transparent;
	color: #e0def4
      }

      #workspaces button.active {
        color: #9ccfd8; /*cyan */
      }

      #workspaces button:hover {
        background: rgba(255, 255, 255, 0.5);
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
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #tray {
        padding: 0 8px;
      }

      #clock:hover,
      #battery:hover,
      #cpu:hover,
      #memory:hover,
      #disk:hover,
      #temperature:hover,
      #backlight:hover,
      #network:hover,
      #pulseaudio:hover,
      #tray:hover {
        background: rgba(26, 27, 38, 0.9);
      }
    '';
  };
}

