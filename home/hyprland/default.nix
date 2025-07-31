{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = { 
      #Monitor
      monitor = [ 
      "DP-1,1920x1080@144,0x0,1"
      ];

      #Start
      exec-once = [
        "${config.home.homeDirectory}/.geta/Scripts/WallPaper.zsh"
        "waybar"
        "wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store & wl-paste --watch cliphist store"
      ];

      #Env
      env = [
        # Hyprland + Wayland
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"

        # Electron / Discord / Browsers
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "MOZ_ENABLE_WAYLAND,1"

	      # SDL for games/emulators
        "SDL_VIDEODRIVER,wayland"
        "WLR_RENDERER,vulkan"
        "_GL_VRR_ALLOWED,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "WLR_NO_HARDWARE_CURSORS,1"
        "CLUTTER_BACKEND,wayland"

	      # QT apps
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"

	      # Licensing
        "NIXPKGS_ALLOW_UNFREE,1"
      ];

      #Look and Feel
      general = {
        gaps_in = 4;
        gaps_out = 8;
        "col.active_border" = "rgba(c4a7e7ff) rgba(f6c177ff) 45deg";
        "col.inactive_border" = "rgba(393552dd)";
        resize_on_border = true;
        border_size = 2;
      	layout = "dwindle";
	      allow_tearing = false;

	      snap = {
	        enabled = true;
	        window_gap = 10;
	        monitor_gap = 10;
	        border_overlap = false;
	      };
      };

      #Input
      input = {

        #Keyboard
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        
        #Numlock
        numlock_by_default = true;  
        
        #Mouse
        follow_mouse = 1;
        sensitivity = 0;

        #Touchpad
        touchpad = {
          natural_scroll = false;
        };
      };

      workspace = [
        "1, monitor:DP-1, default:true"
      ];

      #decoration
      decoration = {
        rounding = 5;
        rounding_power = 2;

        windowrule = [
          "opacity 1.0 override, class:^(firefox|chromium|Brave-browser|Google-chrome)"
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];

        windowrulev2 = [
	        "opacity 1.0 override, class:^.*, fullscreen:1"
          "idleinhibit fullscreen, class:.*"
        ];

        active_opacity = 0.90;
        inactive_opacity = 0.85;
        
        shadow = {
          enabled = true;
          range = 9;
          render_power = 4;
        };

        blur = {
          enabled = true;
	        xray = true;
          size = 4;
          passes = 2;
          vibrancy = 0.6;
	        new_optimizations = true;
	        popups = true;
	        popups_ignorealpha = 0.6;
        };
      };

      #animations
            animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "easeOutQuint,0.23,1,0.32,1"
          "easeinoutcubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 8, easeOutQuint, slide"
          "workspacesIn, 1, 8, easeOutQuint, slide"
          "workspacesOut, 1, 8, easeOutQuint, slide"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      render = {
        explicit_sync = 2;
        explicit_sync_kms = 2;
        direct_scanout = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      #Gestos
      gestures = {
        workspace_swipe = false;
      };

      #Device
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      "$mainMod" = "SUPER";

      #Binds
      bind = [
        # Terminal $ App Launcher
        "$mainMod, Return, exec, ghostty" #terminal
	      "$mainMod, D, exec, rofi -show drun -show-icons" #launcher
        "$mainMod, T, exec, [float] dolphin" #file manager
        "$mainMod+Shift, C, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy" #clipboard
        "$mainMod, Tab, exec, rofi -show" #show launcher 

        # Screenshot/Screencapture
        "$mainMod, P, exec, hyprshot -m region output --clipboard-only --freeze" # partial screenshot capture       
        "$mainMod+Shift, S, exec, hyprshot -m region output --clipboard-only --freeze" # partial screenshot capture 

        # Toggle focused window split
        "$mainMod, slash, togglesplit"

        # Scroll through existing workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"   

      	# Window Management
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, V, togglefloating"
        "$mainMod, P, pseudo"
        "$mainMod, F, fullscreen"

        # Move/Change window focus
        "$mainMod, Left, movefocus, l"  
        "$mainMod, Right, movefocus, r" 
        "$mainMod, Up, movefocus, u"    
        "$mainMod, Down, movefocus, d"  
        "Alt, Tab, movefocus, d"        
                                    
        "$mainMod, H, movefocus, l"     
        "$mainMod, L, movefocus, r"     
        "$mainMod, K, movefocus, u"     
        "$mainMod, J, movefocus, d"     
        "Alt, Tab, movefocus, d"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Switch workspaces to a relative workspace
        "$mainMod+Ctrl, Down, workspace, r+1" #Vertical Workspaces
        "$mainMod+Ctrl, Up, workspace, r-1"
        "$mainMod+Ctrl, Right, workspace, r+1" #Horizontal Workspaces
        "$mainMod+Ctrl, Left, workspace, r-1"

        "$mainMod+Ctrl, j, workspace, r+1" #Vertical Workspaces
        "$mainMod+Ctrl, k, workspace, r-1"
        "$mainMod+Ctrl, l, workspace, r+1" #Horizontal Workspaces
        "$mainMod+Ctrl, h, workspace, r-1"

        # Move focused window to a workspace
        "$mainMod+Shift, 1, movetoworkspace, 1"
        "$mainMod+Shift, 2, movetoworkspace, 2"
        "$mainMod+Shift, 3, movetoworkspace, 3"
        "$mainMod+Shift, 4, movetoworkspace, 4"
        "$mainMod+Shift, 5, movetoworkspace, 5"
        "$mainMod+Shift, 6, movetoworkspace, 6"
        "$mainMod+Shift, 7, movetoworkspace, 7"
        "$mainMod+Shift, 8, movetoworkspace, 8"
        "$mainMod+Shift, 9, movetoworkspace, 9"
        "$mainMod+Shift, 0, movetoworkspace, 10"

     	# Move focused window to a workspace silently
        "$mainMod+Alt, 1, movetoworkspacesilent, 1"
        "$mainMod+Alt, 2, movetoworkspacesilent, 2"
        "$mainMod+Alt, 3, movetoworkspacesilent, 3"
        "$mainMod+Alt, 4, movetoworkspacesilent, 4"
        "$mainMod+Alt, 5, movetoworkspacesilent, 5"
        "$mainMod+Alt, 6, movetoworkspacesilent, 6"
        "$mainMod+Alt, 7, movetoworkspacesilent, 7"
        "$mainMod+Alt, 8, movetoworkspacesilent, 8"
        "$mainMod+Alt, 9, movetoworkspacesilent, 9"
        "$mainMod+Alt, 0, movetoworkspacesilent, 10"
       ];

       bindm = [
       # Move/Resize focused window
         "$mainMod, mouse:272, movewindow"   
         "$mainMod, mouse:273, resizewindow" 
 	       "$mainMod, Z, movewindow"           
	       "$mainMod, X, resizewindow"
       ];

       #SpecialKey
       bindel = [
       # Laptop multimedia keys for volume and LCD brightness
         ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
         ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
         ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
         ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"                   
         ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
         ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
       ];

       #Multimedia
       bindl = [
       # Requires playerctl
         ", XF86AudioNext, exec, playerctl next"
         ", XF86AudioPause, exec, playerctl play-pause"
         ", XF86AudioPlay, exec, playerctl play-pause"
         ", XF86AudioPrev, exec, playerctl previous"
       ];
    };
  };
}
