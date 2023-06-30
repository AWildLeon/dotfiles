#!/bin/env bash

main() {
apt-get install zsh git curl -y

if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "Oh My Zsh is installed."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    chsh -s $(which zsh)
fi



cat > .aliases << EOF
alias ls="ls -la --color=auto"
alias wget=wget --hsts-file="~/.cache/wget-hsts"
update-grub() {grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH && grub-mkconfig -o /boot/grub/grub.cfg}
EOF

cat > .zshrc << EOF

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simonoff"

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 30


if [ -f /etc/arch-release ]; then
    DISTROPLUGIN=archlinux
elif command -v dnf > /dev/null; then
    DISTROPLUGIN=dnf
elif [ -f /etc/debian_version ]; then
    DISTROPLUGIN=debian
fi

plugins=(git docker docker-compose systemd vscode "$DISTROPLUGIN")

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

source ~/.aliases

export EDITOR=nano
export PATH=$PATH:~/.local/bin


export DOCKER_CONFIG=~/.config/docker
export NUGET_PACKAGES=~/.cache/NuGetPackages

clear
echo
echo "Willkommen $USER!"
echo
neofetch
echo

EOF
}
main
