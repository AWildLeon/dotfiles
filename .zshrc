#!/bin/env bash

main() {
apt-get install zsh git curl neofetch -y

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is installed."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    chsh -s $(which zsh)
fi

cat > .aliases << EOF
alias ls="ls -la --color=auto"
alias wget=wget --hsts-file="~/.cache/wget-hsts"
EOF

curl https://raw.githubusercontent.com/AWildLeon/dotfiles/main/.zshrc > .zshrc

}
main
