# --- Bagian 1: Path & Tema ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"  # Tema Keren

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# --- Bagian 2: Plugin (Kunci Fitur Fish) ---
# zsh-autosuggestions = Fitur teks abu-abu yang Anda cari
# zsh-syntax-highlighting = Fitur warna merah/hijau validasi command
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# --- Bagian 3: Load Oh My Zsh ---
source $ZSH/oh-my-zsh.sh

# --- Bagian 4: Load Config Powerlevel10k ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ff() {
    if [ $# -eq 0 ]; then
        echo "Usage: ff <folder>/<theme>"
        echo "Folders: arch, art, groups, hypr, nyarch, os"
        echo "Themes: archlinux, debian, fedora, hypr, nyarch, penrose, pusheen, rem, ubuntu"
        echo "Example: ff arch/archlinux"
    else
        fastfetch --config "$1"
    fi
}

# --- START: AUTO RANDOM FASTFETCH ---

# 1. Cari file .jsonc secara acak di dalam folder fastfetch
# 'find' mencari file, 'shuf -n 1' mengacak dan mengambil satu
RANDOM_THEME=$(find ~/.local/share/fastfetch -name "*.jsonc" | shuf -n 1)

# 2. Jalankan fastfetch dengan tema terpilih
fastfetch --config "$RANDOM_THEME"

# --- END: AUTO RANDOM FASTFETCH ---

alias fastfetch='fastfetch --config "$(find ~/.local/share/fastfetch -name "*.jsonc" | shuf -n 1)"'

# --- SHORTCUT SAKLAR GPU (EnvyControl) ---
alias mode-hemat='sudo envycontrol -s integrated; echo "Mode Hemat Aktif. Silakan Restart."'
alias mode-game='sudo envycontrol -s hybrid; echo "Mode Game Aktif. Silakan Restart."'

# Cek Status
alias cek-gpu='nvtop'
