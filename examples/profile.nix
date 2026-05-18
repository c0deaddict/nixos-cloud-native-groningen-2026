{ pkgs ? import <nixpkgs> { } }:

pkgs.symlinkJoin {
  name = "profile";
  paths = with pkgs; [
    cowsay
    lolcat
  ];
}
