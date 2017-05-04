#!/bin/bash

if [[ -z "$(ls -A /app/data)" ]]; then
    mkdir -p /app/data/keeweb/dav
    cp /app/code/keeweb/vault.kdbx /app/data/keeweb/dav
    chown -R www-data:www-data /app/data
fi

nginx