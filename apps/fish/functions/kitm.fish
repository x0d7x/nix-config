# Kill all tmux sessions except the current one
function kitm
    tmux kill-session -a -t "$argv[1]"
end

# Yazi file picker - jump to selected directory
function zz
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set -l cwd (cat -- "$tmp")
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

    function nz
        # get first argument
        # if it is a directory, cd into it
        set -l dir $argv[1]
        # check if it is empty
        if test -z "$dir"
        else
            z $dir
        end
        set file $(fzf)
        if test -n "$file"
            nvim $file
        else if test -n "$dir"
            cd $dir
        else
            echo "No file selected"
        end
    end
    # Lazy-load fzf
    function fzf_init --on-event fish_prompt
        fzf --fish | source
        functions --erase fzf_init
    end

    # Lazy-load zoxide
    function zoxide_init --on-event fish_prompt
        zoxide init fish | source
        functions --erase zoxide_init
    end
