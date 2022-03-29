let
  pkgs = import <nixpkgs> {};
  mkDerivation = import ./autotools.nix pkgs;
in mkDerivation {
  name = "example7";
  src = ./hello-2.10.tar.gz;
}


