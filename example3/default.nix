with (import <nixpkgs> {});
derivation {

  name = "example2";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];

  coreutils = coreutils;
  #bintools = bintools;
  stdenv = stdenv;

  # need next two things on darwin
  gcc = if builtins.currentSystem == "aarch64-darwin" then clang else gcc;
  binutils = if builtins.currentSystem == "aarch64-darwin" then clang.bintools.bintools_bin else binutils;

  src = ./hello.cpp;
  system = builtins.currentSystem;
}
