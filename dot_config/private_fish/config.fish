if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    # UV/UVX
    uv --generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source

    # Automatically "Warpify" subshells
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'

end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/scampbell/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
