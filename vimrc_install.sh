#!/bin/bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Step 1. Link vimrc to your home directory."
rm ~/.vimrc
ln -s $CURRENT_DIR/.vimrc ~/.vimrc

echo "Step 2. Install vim plugin: bundle."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Step 3. Now opening vim, please input :BundleInstall to finish the plugin install step."
vim

echo "Step 4. Complile some vim plugin:"
echo "        Compliling YouCompleteMe..."
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --clang-completer
cd -

echo "Finished."




