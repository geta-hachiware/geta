{ config, pkgs, lib, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "nvidia" "nvme" "xhci_pci" "usbhid" "sd_mod" ];
      kernelModules = [ "nvidia" ];
    };

    kernelParams = [
      "nvidia-drm.modeset=1"
      "loglevel=3"
    ];

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "kernel.nmi_watchdog" = 0;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
