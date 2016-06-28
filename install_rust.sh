#!/bin/bash

installByChannel()
{
	rustup --channel=$1
}

installByVersion()
{
	rustup --version=$1
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <version(1.8.0, 1.9.0, 1.12.0, ...)|beta|stable|nightly>"
    exit 1
fi

curl -sO https://static.rust-lang.org/rustup.sh
chmod +x rustup.sh
mv rustup.sh /usr/local/bin/rustup

# check type of installation
case $1 in
    "beta"|"stable"|"nightly")
		echo 'install by channel'
        installByChannel $1
        ;;
    *)
		echo 'install by version'
        installByVersion $1
        ;; 
esac

echo 'installed'
