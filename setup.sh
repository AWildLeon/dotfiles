#!/usr/bin/env bash

#check if dir is ~
if [ "$PWD" != "$HOME" ]; then
    mv .* ~
    mv * ~
    cd ~
fi

echo "Installing Oh My Zsh..."
mv .zshrc .zshrc.bak
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mv .zshrc.bak .zshrc

echo "Done!"

rm ./setup.sh
rm README.md
rm -rf .git