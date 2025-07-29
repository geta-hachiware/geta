{
  config,
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      show-icons = true;
      modi: "drun";
      show-icons: true;
      display-drun: "";
    };
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          font = "FiraCode 13";
          spacing = 10;
          margin = 0;
          border = 0;
          border-color = "#000000FF";
          text-color = "#FFFFFFFF"
          placeholder-color = "#888888FF";
          border-radius = 8;
          highlight = "#FFFFFFFF";
          highlight-text = "000000FF";
          alternate-background = "#111111FF";
          background-color = "#000000CC";
          window-border = mkLiteral "2px solid";
          window-border-color = "#FFFFFFFF";
          window-padding = 12;
        };

        "configuration" = {
          modi = "drun";
          show-icons = true;
          display-drun = "";
        };

        "window" = {
          transparency = "real";
          width = 450;
          border-radius = mkLiteral "@border-radius";
          background-color = mkLiteral "@background-color";
          border = mkLiteral "@window-border";
          border-color = mkLiteral "@window-border-color";
          padding = mkLiteral "@window-padding";
        };

        "#mainbox" = {
          spacing = mkLiteral "@spacing";
          margin = mkLiteral "@margin";
          padding = mkLiteral "@padding";
          children = map mkLiteral [
            "inputbar"
            "message"
            "listview"
          ];
        };

        "#inputbar" = {
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
          spacing = mkLiteral "@spacing";
        };

        "prompt" = {
          text-color = mkLiteral "@text-color";
        };

        "entry" = {
          text-color = mkLiteral "@text-color";
          placeholder = "Search Apps";
          placeholder-color = mkLiteral "@placeholder-color";
        };

        "#listview" = {
          columns = 1;
          lines = 7;
          fixed-height = true;
          fixed-columns = true;
          cycle = false;
          scrollbar = false;
          border = "0px solid";
        };

        "element" = {
          spacing = mkLiteral "@spacing";
          margin = mkLiteral "@margin";
          padding = mkLiteral "@padding";
          border = "0px solid";
          border-radius = mkLiteral "@border-radius";
          border-color = mkLiteral "@border-color";
          background-color = "transparent";
          text-color = mkLiteral "@text-color";
        };

        "element normal.normal" = {
          background-color = "transparent";
          text-color = mkLiteral "@text-color";
        };

        "element alternate.normal" = {
          background-color = mkLiteral "@alternate-background";
          text-color = mkLiteral "@text-color";
        }; 

        "element selected.active" = {
          background-color = mkLiteral "@highlight";
          text-color = mkLiteral "@highlight-text";
        };

        "element selected.normal" = {
          background-color = mkLiteral "@highlight";
          text-color = mkLiteral "@highlight-text";
        };

        "message" = {
          background-color = "red";
          border = "0px solid";
        };
      };
  };
}
