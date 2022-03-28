with (import <nixpkgs> {});
derivation {

  name = "example4";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];

  # inherit foo here --> shell variable ${foo}
  # to be defined when ./builder.sh runs
  #
  inherit gnumake;
  inherit gawk;
  inherit gnugrep;
  inherit gnused;
  inherit gnutar;
  inherit gzip;
  inherit coreutils;
  inherit bintools;
  inherit stdenv;

  # need next two things on darwin
  gcc = clang;
  binutils = clang.bintools.bintools_bin;

  src = ./hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
