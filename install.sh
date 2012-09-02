#!/bin/sh

set -e
set -x

git submodule init && git submodule update

# zsh
ln -snf $PWD/grml/etc-core/etc/zsh/zshrc $HOME/.zshrc
ln -snf $PWD/_zshrc.local $HOME/.zshrc.local
ln -snf $PWD/_zshrc.envs $HOME/.zshrc.envs
ln -snf $PWD/_zshrc.aliases $HOME/.zshrc.aliases

# vim
ln -snf $PWD/grml/etc-core/etc/vim/vimrc $HOME/.vimrc
ln -snf $PWD/_vimrc.local $HOME/.vimrc.local
mkdir -p $HOME/.vim/bundle
for V in $PWD/vim/*; do
	ln -snf $V $HOME/.vim/bundle
done

# solarized dircolors
ln -snf $PWD/dircolors/dircolors.ansi-light $HOME/.dircolors

# tmux
ln -snf $PWD/_tmux.conf $HOME/.tmux.conf

# git
ln -snf $PWD/_gitconfig $HOME/.gitconfig

if ! grep -q "^$USER:.*zsh$" /etc/passwd; then
	echo "Changing login shell for $USER to zsh ..."
	chsh -s `which zsh`
fi
