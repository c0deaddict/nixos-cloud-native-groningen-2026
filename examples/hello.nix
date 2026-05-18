{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hello-world";

  buildCommand = let message = "Hello world!"; in ''
    echo '#!${pkgs.bash}/bin/bash' > $out
    echo 'echo "${message}"' >> $out
    chmod +x $out
  '';
}
