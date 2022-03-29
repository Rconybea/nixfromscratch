# NOTE: to debug this builder
#
#  $ cd example7
#  $ nix-shell
#  $ source builder.sh
#

#which which
#which echo
#/usr/bin/touch ${out}/hello.txt
#/usr/bin/env
#echo "pwd=$(pwd)"
#echo "system=${system}"
#echo "bintools=${bintools}"

set -e
set -x

source ${setup}

generic_build

# end builder.sh


