#!/bin/sh

guard_start() {
    echo '' >> ~/.bashrc
    echo "# === Below this is your worst nightmare === " >> ~/.bashrc
    echo '' >> ~/.bashrc
}

guard_end() {
    echo '' >> ~/.bashrc
    echo "# === This is the end your nightmare === " >> ~/.bashrc
}

easy() {
    echo "alias vim=\"emacs\""
    echo "alias nano=\"emacs\""
}

normal() {
    easy
    echo "sleep \$(awk 'BEGIN {srand(); print 1.5 + rand()}')"
    echo "alias hx=\"emacs\""
}

hard() {
    normal
    echo 'PROMPT_COMMAND='\''[ $? -ne 0 ] && i3lock'\'''
}

impossible() {
    hard
    echo 'alias vi="emacs"'
    echo 'alias vim="emacs"'
    echo 'alias nvim="emacs"'
    echo 'alias nano="emacs"'
    echo 'alias hx="emacs"'
    echo 'alias gedit="emacs"'
    echo 'alias micro="emacs"'
    echo 'alias joe="emacs"'
    echo 'alias ed="emacs"'
    echo 'alias ex="emacs"'

    echo 'unalias() {'
    echo '    echo "Nice try ! You are quite smart" >&2'
    echo '    return 1'
    echo '}'
}

clean() {
    guard_start
    echo "unalias -a 2>/dev/null"
    echo "enable -a unalias 2>/dev/null"
    echo "unset -f unalias command_not_found_handle 2>/dev/null"
    echo "unset PROMPT_COMMAND"
    guard_end
}

clear() {
    sed -i '/# === Below this is your worst nightmare ===/,/# === This is the end your nightmare ===/d' ~/.bashrc 2>/dev/null
    rm install.sh
}

case "$1" in
    easy)
        echo "Emacs Hater"
        guard_start
        easy >> ~/.bashrc
        guard_end
        ;;
    normal)
        echo "Normal One"
        guard_start
        normal >> ~/.bashrc
        guard_end
        ;;
    hard)
        echo "Quite hard lmao"
        guard_start
        hard >> ~/.bashrc
        guard_end
        ;;
    impossible)
        echo "o7"
        guard_start
        impossible >> ~/.bashrc
        guard_end
        ;;
    clean)
        sed -i '/# === Below this is your worst nightmare ===/,/# === This is the end your nightmare ===/d' ~/.bashrc 2>/dev/null
        clean >> ~/.bashrc
        ;;
    clear)
        clear
        ;;
    *)
        echo "You should use this shell with ' easy / normal / hard / impossible '"
        exit 1
        ;;
esac
