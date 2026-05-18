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

  users.users.root.password = "nixos";

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
  };
  services.displayManager.defaultSession = "xfce";

  environment.systemPackages = with pkgs; [ cowsay ];

  environment.etc."test".text =
    let
      var = if config.networking.hostName == "mymachine" then "yes" else "no";
    in
    ''
      immutable config file. var = ${var}
    '';

  boot.kernelPackages = pkgs.linuxPackages_7_0;

  system.stateVersion = "26.05";
}
