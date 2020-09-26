# Stuart's dotfiles and associated junk

## To setup a new machine

1. Install 1Password pre-requisites
 https://cache.agilebits.com/dist/1P/op/pkg/v1.7.0/op_darwin_amd64_v1.7.0.pkg
 https://cache.agilebits.com/dist/1P/op/pkg/v1.7.0/op_linux_amd64_v1.7.0.zip
 https://cache.agilebits.com/dist/1P/op/pkg/v1.7.0/op_linux_arm_v1.7.0.zip
 
 curl -sfL https://git.io/chezmoi | sh
 
2. Initial login to 1Password

```op signin my.1password.com <insert email>```
```eval $(op signin my)

3. Install `chezmoi`

4. Apply dotfiles

`chezmoi init --apply --verbose https://github.com/stuartcampbell/dotfiles.git`


