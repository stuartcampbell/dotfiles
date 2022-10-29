# Stuart's dotfiles and associated junk

[![CI](https://github.com/stuartcampbell/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/stuartcampbell/dotfiles/actions/workflows/ci.yml)

Secrets are stored in [1Password](https://1password.com/), and so we need the 
[1Password CLI](https://support.1password.com/command-line-getting-started/) installed.

## Install chezmoi

NOTE: I have found that using the chezmoi install script means that the integration 
with the 1password-cli is broken.  Using one of the packages (rpm, deb, macOS, Windows)
seems to work fine though.

## Apply dotfiles

    chezmoi init --apply stuartcampbell/dotfiles

Or to be a little more conservative:

    chezmoi init stuartcampbell/dotfiles
    
Look at what changes would be applied

    chezmoi diff
    
Now apply them

    chezmoi apply -v