#!/bin/fish

set buildopt ""
if [ \((set -q $argv[1])\) -a \($argv[1] = "termux"\) ]
    set buildopt "-DWITH_HWLOC=OFF"
end

cd (status dirname)

mkdir build
cd build
cmake $buildopt ..
make -j(nproc)
cd ..

mkdir out
mv build/xmrig out
