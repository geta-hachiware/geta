{ config, pkgs, lib, ... }: 

{
  environment.systemPackages = with pkgs; [
    protonup
    mangohud
    lutris
    bottles
    heroic
  ];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };
  programs.gamemode = {
    enable = true;
  };

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS =
        "\${HOME}/.steam/root/compatibilitytools.d";
    };
}
