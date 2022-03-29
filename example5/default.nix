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
  buildInputs = (if builtins.currentSystem == "aarch64-darwin" then [ clang clang.bintools.bintools_bin ] else [ gcc binutils-unwrapped ]) ++ [ gnumake gawk gnugrep gnused gnutar gzip coreutils stdenv ];

  src = ./hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
