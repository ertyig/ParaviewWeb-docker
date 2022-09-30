#!/bin/bash

service nginx start

export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/root/build/llvm/lib:$LD_LIBRARY_PATH

if [ -z "$DATASET_HID" ]
then
    Visualizer --paraview /usr/local/lib/paraview-$PV_VERSION_MAJOR/ \
        --data /input \
        --port 9000 \
        --server-only
else
    Visualizer --paraview /usr/local/lib/paraview-$PV_VERSION_MAJOR/ \
        --data /input \
        --port 9000 \
        --server-only \
        --load-file $DATASET_HID
fi

