with (import <nixpkgs> {});
derivation {
  name = "example1";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  inherit coreutils;
  system = builtins.currentSystem;
}
