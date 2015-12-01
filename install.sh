#!/bin/sh

set -e
set -x

git submodule update --init
git submodule foreach git checkout master
git submodule foreach git pull

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
ln -snf $PWD/dircolors/dircolors.ansi-light $HOME/.config/dircolors

# tmux
mkdir -p $HOME/.config/tmux
ln -snf $PWD/tmux/config $HOME/.config/tmux/config

# git
mkdir -p $HOME/.config/git
ln -snf $PWD/git/config $HOME/.config/git/config
ln -snf $PWD/git/ignore $HOME/.config/git/ignore

# xfce4-terminal
mkdir -p $HOME/.config/xfce4/terminal
ln -snf $PWD/xfce4/terminal/terminalrc $HOME/.config/xfce4/terminal/terminalrc
mkdir -p $HOME/.config/xfconf/xfce-perchannel-xml
ln -snf $PWD/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml \
    $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

# vim powerline fonts
mkdir -p $HOME/.fonts
ln -snf $PWD/powerline/PowerlineSymbols.otf $HOME/.fonts
fc-cache -vf ~/.fonts/

mkdir -p $HOME/.config/fontconfig/conf.d
ln -snf $PWD/powerline/10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d


# Debian packaging tools
ln -snf $PWD/_reportbugrc $HOME/.reportbugrc
ln -snf $PWD/_devscripts $HOME/.devscripts
ln -snf $PWD/_gbp.conf $HOME/.gbp.conf
ln -snf $PWD/_lintianrc $HOME/.lintianrc

if ! grep -q "^$USER:.*zsh$" /etc/passwd; then
    echo "Changing login shell for $USER to zsh ..."
    chsh -s `which zsh`
fi

mkdir -p "$HOME/.config/beets"
ln -snf $PWD/beets/config.yaml $HOME/.config/beets/config.yaml

# vim:sw=4:sts=4:et:tw=78
