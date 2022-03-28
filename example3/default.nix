with (import <nixpkgs> {});
derivation {

  name = "example2";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];

  inherit coreutils;
  inherit bintools;
  inherit stdenv;

  # need next two things on darwin
  gcc = clang;
  binutils = clang.bintools.bintools_bin;

  src = ./hello.cpp;
  system = builtins.currentSystem;
}
