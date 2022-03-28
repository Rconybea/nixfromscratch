# i.e. lambda pkgs . lambda attrs . (with pkgs ...  )
pkgs: attrs:
  with pkgs;
  let defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    # vs nix pills #8:  +bintools +stdenv, -binutils-unwrapped
    baseInputs = [ clang clang.bintools.bintools_bin gnumake gawk gnugrep gnused gnutar gzip coreutils bintools stdenv ];
    buildInputs = [];
    system = builtins.currentSystem;
  };
  in
  derivation (defaultAttrs // attrs)
