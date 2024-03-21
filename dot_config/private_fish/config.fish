if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    # Automatically "Warpify" subshells
    printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish"}}\x9c'

end
