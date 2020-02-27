#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Node installs
node i -g eslint

# Install zsh-syntax-highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/.bash_profile $HOME/.bash_profile

# Set gitignore global
rn -rf $HOME/.gitignore_global
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Setup vim 
rm -rf $HOME/.vimrc 
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# Setup tmux
rm -r $HOME/.tmux.conf
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

# Install https://github.com/rupa/z  (z - jump around)
curl -fLo $HOME/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh

# Setup asdf plugins
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring\n
asdf install nodejs 12.16.1

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang 22.1
asdf global erlang 22.1

asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.9
asdf global elixir 1.9

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
