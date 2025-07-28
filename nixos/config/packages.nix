{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nano
    curl
    git
    vim
    kdePackages.kate
  ];
  
  # Fonts system
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
  
  # firefox
  programs.firefox.enable = true;
}
