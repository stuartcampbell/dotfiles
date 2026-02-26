if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    # UV/UVX
    uv --generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source

    # Automatically "Warpify" subshells
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'

end

# Go bin directory
fish_add_path ~/go/bin

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
fish_add_path ~/.rd/bin
#set --export --prepend PATH "/Users/scampbell/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/scampbell/.lmstudio/bin
# End of LM Studio CLI section
