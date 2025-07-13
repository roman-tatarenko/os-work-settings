#!/bin/bash

set -e

# --- Utility functions ---

print_info() {
    echo -e "ℹ️ $1"
}

print_success() {
    echo -e "✅ $1"
}

print_error() {
    echo -e "❌ $1"
}

prompt_confirm() {
    read -p "$1 (y/n): " answer
    [[ "$answer" == "y" ]]
}

install_and_verify() {
    local cmd="$1"
    local name="$2"
    local version_cmd="${3:-$cmd --version}"

    print_info "Installing '$name'..."
    brew install "$cmd"

    if command -v "$cmd" &> /dev/null; then
        print_success "'$name' installed successfully!"
        eval "$version_cmd"
    else
        print_error "Failed to install '$name'."
        exit 1
    fi
}

append_if_not_exists() {
    local file="$1"
    local text="$2"

    if ! grep -Fxq "$text" "$file"; then
        echo "$text" >> "$file"
        print_info "Added to $file: $text"
    else
        print_info "Already present in $file: $text"
    fi
}

# --- Check shell and switch to zsh if needed ---

current_shell=$(basename "$SHELL")
print_info "Current shell: $current_shell"

if [[ "$current_shell" != "zsh" ]]; then
    print_error "Your current shell is not Zsh."
    if prompt_confirm "Do you want to switch your shell to Zsh now?"; then
        if ! command -v zsh &> /dev/null; then
            install_and_verify "zsh" "Zsh"
        fi
        print_info "Changing default shell to Zsh..."
        chsh -s "$(which zsh)"
        print_success "Default shell changed to Zsh. Please restart your terminal."
        exit 0
    else
        print_error "Zsh is required. Exiting."
        exit 1
    fi
fi

# --- Install Oh My Zsh if not installed ---

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    print_success "Oh My Zsh is already installed."
fi

# --- Check Homebrew installation ---

if ! command -v brew &> /dev/null; then
    if [ -d /opt/homebrew/bin ]; then
        print_info "Adding Homebrew to PATH..."
        append_if_not_exists ~/.zshrc 'export PATH="/opt/homebrew/bin:$PATH"'
        source ~/.zshrc
    else
        print_error "Homebrew is not installed."
        if prompt_confirm "Install Homebrew now?"; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        else
            print_error "Homebrew required. Exiting."
            exit 1
        fi
    fi
fi

print_success "Homebrew is available:"
brew --version

# --- Install packages ---

install_and_verify "tree" "tree"
install_and_verify "htop" "htop"
install_and_verify "openvpn" "openvpn" "openvpn --version | head -n 1"
install_and_verify "git" "git"
install_and_verify "pyenv" "pyenv"
install_and_verify "pyenv-virtualenv" "pyenv-virtualenv"
install_and_verify "direnv" "direnv"

# --- Configure pyenv ---

PYENV_CONF='# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"'

if ! grep -Fxq 'export PYENV_ROOT="$HOME/.pyenv"' ~/.zshrc; then
    echo "$PYENV_CONF" >> ~/.zshrc
    print_success "Added pyenv configuration to ~/.zshrc"
    source ~/.zshrc
else
    print_info "pyenv configuration already exists in ~/.zshrc"
fi

# --- Configure direnv ---

if ! grep -Fxq 'eval "$(direnv hook zsh)"' ~/.zshrc; then
    echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
    print_success "Added direnv hook to ~/.zshrc"
    source ~/.zshrc
else
    print_info "direnv hook already present in ~/.zshrc"
fi

print_success "All done! Please restart your terminal to apply all changes."
