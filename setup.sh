#!/usr/bin/env bash

#check if dir is ~
if [ "$PWD" != "$HOME" ]; then
    cp -R ./.* ~ --backup=existing
    cp -R ./* ~ --backup=existing
    cd ~
fi

echo "Installing Oh My Zsh..."
mv .zshrc .zshrc.bak
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv .zshrc.bak .zshrc

chsh -s "$(which zsh)"

echo "Done!"

echo "Install Neofetch please!"

rm ./setup.sh
rm README.md
rm -rf .git