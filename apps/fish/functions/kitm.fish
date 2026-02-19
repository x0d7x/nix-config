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

