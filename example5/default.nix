with (import <nixpkgs> {});
derivation {

  name = "example5";
  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];

  # inherit foo here --> shell variable ${foo}
  # to be defined when ./builder.sh runs
  #
  # note: clang, clang.bintools.bintools_bin needed for darwin
  #
  buildInputs = [ clang clang.bintools.bintools_bin gnumake gawk gnugrep gnused gnutar gzip coreutils bintools stdenv ];

  src = ./hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
