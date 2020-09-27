#!/bin/sh

version="v1.13.0"
destdir="${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"

rm -rf ${destdir}
mkdir -p ${destdir}
curl -s -L https://github.com/romkatv/powerlevel10k/archive/${version}.tar.gz | tar -C ${destdir} --strip-components=1 -xzf -
