# i.e. lambda pkgs . lambda attrs . (with pkgs ...  )
pkgs: attrs:
  with pkgs;
  let defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    baseInputs = (if builtins.currentSystem == "aarch64-darwin" then [ clang clang.bintools.bintools_bin ] else [ gcc binutils-unwrapped ])
                   ++ [ gnumake gawk gnugrep gnused gnutar gzip coreutils stdenv findutils ];
    buildInputs = [];
    system = builtins.currentSystem;
  };
  in
  derivation (defaultAttrs // attrs)
