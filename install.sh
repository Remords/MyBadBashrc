#!/bin/sh

guard_start() {
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
    echo 'PROMPT_COMMAND="sleep \$(echo \"scale=2; 0.8 + (\$RANDOM % 11) / 10\" | bc 2>/dev/null || echo 1); \$PROMPT_COMMAND"'
    echo "alias hx=\"emacs\""
}

hard() {
    easy
    echo 'PROMPT_COMMAND="\[ \$? -ne 0 \] && i3lock; sleep \$(echo \"scale=2; 0.8 + (\$RANDOM % 11) / 10\" | bc 2>/dev/null || echo 1); \$PROMPT_COMMAND"'
    echo "alias hx=\"emacs\""
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
    echo "unset PROMPT_COMMAND"
    echo "PROMPT_COMMAND=''"
    echo "unalias vim nano hx vi nvim gedit micro joe ed ex 2>/dev/null"
    echo "enable -a unalias 2>/dev/null"
    echo "unset -f unalias command_not_found_handle 2>/dev/null"
}

clear() {
    sed -i '/# === Below this is your worst nightmare ===/,/# === This is the end your nightmare ===/d' ~/.bashrc 2>/dev/null
    # rm install.sh
}

case "$1" in
    easy)
        echo "Emacs Hater"
        clear
        guard_start
        easy >> ~/.bashrc
        guard_end
        ;;
    normal)
        echo "Normal One"
        clear
        guard_start
        normal >> ~/.bashrc
        guard_end
        ;;
    hard)
        echo "Quite hard lmao"
        clear
        guard_start
        hard >> ~/.bashrc
        guard_end
        ;;
    impossible)
        echo "o7"
        clear
        guard_start
        impossible >> ~/.bashrc
        guard_end
        ;;
    clean)
        echo "I'm such a nice guy"
        clear
        guard_start
        clean >> ~/.bashrc
        guard_end
        ;;
    clear)
        clear
        echo "Traces effacées !"
        ;;
    *)
        echo "You should use this shell with ' easy / normal / hard / impossible / clean / clear '"
        exit 1
        ;;
esac
