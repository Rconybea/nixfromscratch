#which which
#which echo
#/usr/bin/touch ${out}/hello.txt
#/usr/bin/env
#echo "pwd=$(pwd)"
#echo "system=${system}"
#echo "bintools=${bintools}"

PATH=${gnumake}/bin:${gcc}/bin:${binutils}/bin:${gawk}/bin:${gnugrep}/bin:${gnused}/bin:${gnutar}/bin:${gzip}/bin:${coreutils}/bin:${stdenv}/bin:
export PATH

echo $PATH
#/usr/bin/env

#${ls} ${bintools}/bin
#${ls} ${bintools}/nix-support

mkdir ${out}

if [[ ${system} -eq "aarch64-darwin" ]]; then
    # workaround -- looks like darwin package assumes codesign_allocate in path.
    # create a temporary link to /usr/bin/codesign_allocate
    # There's a PR with this hash 63f2bf3859321531c24b9558729d47b560e90c3e
    # that fixes darwin-packages.nix to use absolute path to codesign_allocate.

    # maybe don't need this if binutils = clang.bintools.bintools_bin chosen?

    # temporary bin directory for codesign_allocate
    mkdir bin
    (cd bin && ln -s /usr/bin/codesign_allocate)

    PATH=${PATH}:$(pwd)/bin
fi

tar -xzf ${src}
cd hello-2.10
./configure --prefix=${out}
make
make install

#${coreutils}/bin/env > ${out}/hello.env

#echo "out=${out}"
#echo "hello world" > ${out}/hello.txt
