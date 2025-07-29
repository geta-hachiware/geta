{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "hachi";
  home.homeDirectory = "/home/hachi";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./zsh.nix
    ./hyprland/default.nix
    ./waybar/default.nix
    ./ghostty.nix
    ./mako.nix
    ./git.nix
    ./nixcord.nix
    ./spicetify.nix
    inputs.nixcord.homeModules.nixcord
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];
     # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    cava
    swww
    fastfetch
    hyprshot
    wl-clipboard
    libreoffice-qt6-fresh
    rofi-wayland
    pavucontrol
    inputs.nixvim.packages.${system}.default
    imagemagick
    cliphist
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hachi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
