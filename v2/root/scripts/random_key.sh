#! /bin/sh

head /dev/urandom | tr -dc A-Za-z0-9 | head -c10
