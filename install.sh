#!/bin/bash -e

# Installs Optixal's neovim-init.vim into ~/.config/nvim/init.vim. Intended for Ubuntu/Debian. I highly recommend running the following commands manually, especially if you are running macOS or other Linux distros. For macOS, use homebrew instead of apt.

# Make config directory for Neovim's init.vim
echo '[*] Preparing Neovim config directory ...'
mkdir -p ~/.config/nvim

# Install nvim (and its dependencies: pip3, git), Python 3 and ctags (for tagbar)
echo '[*] App installing Neovim and its dependencies (Python 3 and git), and dependencies for tagbar (exuberant-ctags) ...'
brew update
brew install neovim python3 git curl ctags

# Install virtualenv to containerize dependencies for vim-pydocstring (doq) and pep8-style formatting feature (yapf)
echo '[*] Installing Python dependencies in a virtual environment ...'
sudo python3 -m venv ~/.config/nvim/env
source ~/.config/nvim/env/bin/activate
pip install wheel
pip install yapf doq
deactivate

# Install Node.js v16.x (for Ubuntu) for coc.vim
brew install nodejs

# Install The Silver Searcher (ag), ripgrep (rg) and bat for fzf.vim
brew install the_silver_searcher
brew install bat ripgrep
brew install fzf

# Install vim-plug plugin manager
echo '[*] Downloading vim-plug, the best minimalistic vim plugin manager ...'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create a backup of your current coc-settings.json if you have one
if [ -f ~/.config/nvim/coc-settings.json ]; then
    echo '[*] Backing up existing coc-settings.json'
    cp ~/.config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json.backup
fi

# Copy coc-settings.json in current working directory to nvim's config location. This is for custom diagnostic signs
echo '[*] Copying coc-settings.json -> ~/.config/nvim/coc-settings.json'
cp coc-settings.json ~/.config/nvim/

# Create a backup of your current init.vim if you have one
if [ -f ~/.config/nvim/init.vim ]; then
    echo '[*] Backing up existing init.vim'
    cp ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
fi

# Enter Neovim and install plugins with vim-plug's :PlugInstall and coc extensions with CoC's :CocInstall using a temporary init.vim, which avoids warnings about missing colorschemes, functions, etc
echo -e '[*] Running :PlugInstall within nvim ...'
sed '/call plug#end/q' init.vim > ~/.config/nvim/init.vim
nvim -c 'PlugInstall' -c 'qa'
rm ~/.config/nvim/init.vim

# Copy init.vim in current working directory to nvim's config location
echo '[*] Copying init.vim -> ~/.config/nvim/init.vim'
cp init.vim ~/.config/nvim/

# install ruby and c-extension for comamnd-t plugins
cd ~/.config/nvim/plugged/ruby/command-t/ext/command-t
ruby extconf.rb
make

# change system key repeat rate to the lowest possible to speed up cursor moving
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

echo -e "[+] Done, welcome to your new \033[1m\033[92mNeovim\033[0m experience! Try it by running: nvim. Want to customize it? Modify ~/.config/nvim/init.vim! Remember to change your terminal font to Iosevka Term Nerd Font, or any other preferred nerd font :)"
