# Stuart's dotfiles and associated junk

## To setup a new machine

1. Install 1Password and Chezmoi 

  https://app-updates.agilebits.com/product_history/CLI
 
 curl -sfL https://git.io/chezmoi | sh
 
2. Initial login to 1Password

```op signin my.1password.com <insert email>```
```eval $(op signin my)

3. Install `chezmoi`

4. Apply dotfiles

`chezmoi init --apply --verbose https://github.com/stuartcampbell/dotfiles.git`


