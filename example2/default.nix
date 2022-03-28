with (import <nixpkgs> {});
derivation {

  name = "example2";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  inherit coreutils;
  inherit bintools;
  inherit gcc;
  src = ./hello.cpp;
  system = builtins.currentSystem;
}
