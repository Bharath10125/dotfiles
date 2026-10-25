export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  sudo
  extract
  docker
  docker-compose
  fzf
  zoxide
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh


# ─────────────────────────────────────────────
# NVM
# ─────────────────────────────────────────────

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ─────────────────────────────────────────────
# Android
# ─────────────────────────────────────────────
export ANDROID_HOME="$HOME/android/platform-tools-latest-linux"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/cmdline-tools/bin:$PATH"


# ─────────────────────────────────────────────
# Pyenv
# ─────────────────────────────────────────────

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# eval "$(pyenv init - zsh)"


# ─────────────────────────────────────────────
# Local binaries
# ─────────────────────────────────────────────

# export PATH="/home/bharath/.local/bin:$PATH"
# export PATH="/opt/nvim-linux-x86_64/bin:$PATH"


# ─────────────────────────────────────────────
# Atuin
# ─────────────────────────────────────────────

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"


# ═════════════════════════════════════════════
# CUSTOM NATIVE ZSH PROMPT
# Replaces Oh My Posh
# ═════════════════════════════════════════════

autoload -Uz add-zsh-hook

# ── Colors ────────────────────────────────────

C_BLUE=$'\e[38;2;126;184;218m'       # #7eb8da
C_PURPLE=$'\e[38;2;190;157;223m'     # #be9ddf
C_PINK=$'\e[38;2;255;165;216m'       # #ffa5d8
C_GREEN=$'\e[38;2;152;191;173m'      # #98bfad
C_WHITE=$'\e[38;2;255;255;255m'
C_YELLOW=$'\e[38;2;255;255;0m'
C_RED=$'\e[38;2;255;0;0m'
RESET=$'\e[0m'


# ── Execution timer ──────────────────────────

_prompt_start=0

_prompt_preexec() {
    _prompt_start=$EPOCHREALTIME
}

add-zsh-hook preexec _prompt_preexec


# ── RAM ───────────────────────────────────────

_prompt_ram() {
    local total available used

    total=$(awk '/MemTotal:/ {print $2}' /proc/meminfo)
    available=$(awk '/MemAvailable:/ {print $2}' /proc/meminfo)

    used=$(( total - available ))

    printf "%.0f/%.0fGB" \
        "$(( used / 1024 / 1024 ))" \
        "$(( total / 1024 / 1024 ))"
}


# ── Battery ───────────────────────────────────

_prompt_battery() {
    local bat state percentage

    bat=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' 2>/dev/null | head -n1)

    [[ -z "$bat" ]] && return

    percentage=$(<"$bat/capacity")
    state=$(<"$bat/status")

    case "$state" in
        Charging)
            print "${C_BLUE}󰖅 ${percentage}${RESET}"
            ;;
        Discharging)
            print "${C_YELLOW} ${percentage}${RESET}"
            ;;
        Full)
            print "${C_GREEN} ${percentage}${RESET}"
            ;;
    esac
}


# ── Git ───────────────────────────────────────

_prompt_git() {
    local branch git_status

    branch=$(git symbolic-ref --short HEAD 2>/dev/null)

    [[ -z "$branch" ]] && return

    git_status=""

    # Working tree
    if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
        git_status+=" ${C_WHITE}"
    fi

    # Ahead / behind
    local counts
    counts=$(git rev-list --left-right --count '@{upstream}...HEAD' 2>/dev/null)

    if [[ -n "$counts" ]]; then
        local behind=${counts%%$'\t'*}
        local ahead=${counts##*$'\t'}

        (( ahead > 0 )) && git_status+=" ↑${ahead}"
        (( behind > 0 )) && git_status+=" ↓${behind}"
    fi

    # Stash
    local stash
    stash=$(git stash list 2>/dev/null | wc -l)

    (( stash > 0 )) && git_status+=" ${C_WHITE} ${stash}"

    print "${C_PINK}[${C_WHITE}${branch}${git_status}${C_PINK}]${RESET}"
}


# ── Main prompt ───────────────────────────────

_prompt_precmd() {
    local exit_code=$?
    local elapsed="0"

    # Calculate command execution time
    if (( _prompt_start > 0 )); then
        elapsed=$(awk \
            -v start="$_prompt_start" \
            -v end="$EPOCHREALTIME" \
            'BEGIN { printf "%.2f", end-start }')
    fi


    # ── First line ────────────────────────────

    PROMPT="${C_BLUE}┏${RESET}"
    PROMPT+="[${C_BLUE}${RESET} ${USER} ${C_BLUE}::${RESET} ${C_WHITE}${RESET} ${HOST}]"

    # RAM
    PROMPT+="[${C_PURPLE}${RESET} RAM: $(_prompt_ram)]"

    # Battery
    local battery
    battery=$(_prompt_battery)

    [[ -n "$battery" ]] && \
        PROMPT+="[${battery}]"

    # Clock
    local clock="[${C_BLUE}${RESET} $(date '+%H:%M:%S')]"

    PROMPT+=" ${clock}"


    # ── Second line ───────────────────────────

    PROMPT+="
${C_BLUE}┣${RESET}[${C_WHITE}${RESET} ${C_GREEN}%~${RESET}]"

    # Git
    local git
    git=$(_prompt_git)

    [[ -n "$git" ]] && \
        PROMPT+=" ${git}"

    # Execution time
    PROMPT+=" [${C_PURPLE}${RESET} ${elapsed}s]"


    # ── Third line ────────────────────────────

    PROMPT+="
${C_BLUE}└─${RESET}"

    # Root indicator
    if (( EUID == 0 )); then
        PROMPT+="${C_YELLOW}[#]${RESET}"
    fi

    # Error indicator
    if (( exit_code != 0 )); then
        PROMPT+="${C_PINK}[${C_WHITE}${C_PINK} Error, check your command]${RESET}"
    fi

    PROMPT+="
> "
}

add-zsh-hook precmd _prompt_precmd

# Build prompt immediately
_prompt_precmd
export PATH="/home/bharath/.local/bin:$PATH"
alias obsidian='flatpak run md.obsidian.Obsidian'
export GOROOT=$HOME/go
export GOPATH=$HOME/go-workspace
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
alias ezbookkeeping='cd ~/Documents/anakin/ezbookkeeping && ./ezbookkeeping server run'

# opencode
export PATH=/home/bharath/.opencode/bin:$PATH
