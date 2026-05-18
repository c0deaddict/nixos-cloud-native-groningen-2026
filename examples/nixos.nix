{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "mymachine";
  time.timeZone = "Europe/Amsterdam";

  users.users.myuser = {
    extraGroups = [ "wheel" "networkmanager" ];
    isNormalUser = true;
    password = "myuser";
  };

  environment.systemPackages = with pkgs; [ cowsay ];

  system.stateVersion = "26.05";
}
