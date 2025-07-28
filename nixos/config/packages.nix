{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nano
    curl
    git
    vim
    kdePackages.kate
  ];
  
  # Fonts system
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      corefonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-color-emoji
      material-icons
      font-awesome
      fira-code-symbols 
      nerd-fonts.jetbrains-mono
    ];
  };
  
  # firefox
  programs.firefox.enable = true;
}
