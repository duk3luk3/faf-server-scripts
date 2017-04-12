#!/bin/bash

for file in $1; do
    if ( unzip -c "$file" | grep -q "$2"); then
        echo "$file"
    fi
done
