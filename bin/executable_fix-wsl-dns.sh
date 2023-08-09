#!/bin/bash

TMP=`mktemp`
trap ctrlC INT

removeTempFiles() {
        rm -f $TMP
}

ctrlC() {
        echo
        echo "Trapped Ctrl-C, removing temporary files"
        removeTempFiles
        stty sane
}

echo "Current resolv.conf"
echo "-------------------"
cat /etc/resolv.conf

echo
echo "Creating new resolv.conf"
echo "------------------------"

{
        head -1 /etc/resolv.conf | grep '^#.*generated'
        for i in `/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "Get-DnsClientServerAddress -AddressFamily ipv4 | Select-Object -ExpandProperty ServerAddresses"`; do
                echo nameserver $i
        done
        tail -n+2 /etc/resolv.conf | grep -v '^nameserver'
} | tr -d '\r' | tee $TMP

(set -x; sudo cp -if  $TMP /etc/resolv.conf)

removeTempFiles
