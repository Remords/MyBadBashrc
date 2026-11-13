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
    echo 'alias vim="emacs"'
    echo 'alias nano="emacs"'
}

normal() {
    easy
    echo 'command_not_found_handle() {'
    echo '    [[ -n "$__cnf_running" ]] && return 127'
    echo '    local __cnf_running=1'
    echo '    if command -v i3lock >/dev/null 2>&1; then'
    echo '        i3lock >/dev/null 2>&1'
    echo '    else'
    echo '        echo "bash: $1: command not found" >&2'
    echo '    fi'
    echo '    return 127'
    echo '}'
    echo 'alias hx="emacs"'
}

hard() {
    normal
    echo ''
    echo '__pause_done=0'
    echo '__random_sleep() {'
    echo '  [[ -n "$COMP_LINE" ]] && return'
    echo '  [[ "$BASH_COMMAND" == __* ]] && return'
    echo '  if [[ $__pause_done -eq 0 ]]; then'
    echo '    __pause_done=1'
    echo '    sleep "$(awk '\''BEGIN{srand(); printf "%.2f", 1.1 + rand()}'\'')"'
    echo '  fi'
    echo '}'
    echo 'trap '\''__random_sleep'\'' DEBUG'
    echo 'PROMPT_COMMAND='\''__pause_done=0'\''"${PROMPT_COMMAND:+;$PROMPT_COMMAND}"'
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

    echo "command() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo "which() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo "sh() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo "dash() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"

    echo "_run_current_system_sw_bin_bash() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo ""
    echo "_run_current_system_sw_bin_sh() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo ""
    echo "_nix_store_yisa2lg79zcvgk4ck4yr6r0lz6j63hs3_bash_interactive_5_3p9_bin_bash() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo ""
    echo "_nix_store_yisa2lg79zcvgk4ck4yr6r0lz6j63hs3_bash_interactive_5_3p9_bin_sh() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
    echo ""
    echo "_bin_sh() {"
    echo "    echo \"Nice try ! You are quite smart\""
    echo "}"
}

clean() {
    echo '__random_sleep() { :; }'
    echo 'trap - DEBUG'
    echo 'unset -f unalias command_not_found_handle command which sh /bin/sh dash 2>/dev/null'
    echo 'unalias vim nano hx vi nvim gedit micro joe ed ex 2>/dev/null'
    echo 'PROMPT_COMMAND=${PROMPT_COMMAND//__pause_done=0;/}'
    echo 'PROMPT_COMMAND=${PROMPT_COMMAND//__pause_done=0/}'
    echo 'unset __pause_done'
}

purge() {
    sed -i '/# === Below this is your worst nightmare ===/,/# === This is the end your nightmare ===/d' ~/.bashrc 2>/dev/null
}

case "$1" in
    easy)
        echo "Emacs Hater"
        purge
        guard_start
        easy >> ~/.bashrc
        guard_end
        ;;
    normal)
        echo "Normal One"
        purge
        guard_start
        normal >> ~/.bashrc
        guard_end
        ;;
    hard)
        echo "Quite hard lmao"
        purge
        guard_start
        hard >> ~/.bashrc
        guard_end
        ;;
    impossible)
        echo "o7"
        purge
        guard_start
        impossible >> ~/.bashrc
        guard_end
        ;;
    clean)
        echo "I'm such a nice guy"
        purge
        guard_start
        clean >> ~/.bashrc
        guard_end
        ;;
    clear)
        purge
        ;;
    *)
        echo "You should use this shell with ' easy / normal / hard / impossible / clean / clear '"
        exit 1
        ;;
esac
