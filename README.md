# Fork of Optixal's Neovim init.vim
## Functionalities
* Changed the default install.sh to be used in MacOS. The original install.sh was renamed to install-ubuntu.sh  
* The recommened font can be changed to [MesloLGS NF](https://github.com/romkatv/dotfiles-public/blob/master/.local/share/fonts/NerdFonts/MesloLGS%20NF%20Regular.ttf)  
* Changed the default color theme from dracula to [Rigel](https://github.com/Rigellute/rigel)  
* Changed cursor to blinking all the time. `set guicursor=a:blinkwait700-blinkon400-blinkoff250`
* Speed up the cursor moving (by hjkl) by setting the system key repeat rate to the lowest. See this [link](https://gist.github.com/hofmannsven/ff21749b0e6afc50da458bebbd9989c5)
* Allow mouse use
* Sync clipboard with system
* Highlight current line
* Stop newline continution of comments
* Auto source after making changes to init.vim

## Added plugins:  
* ['haya14busa/incsearch.vim'](https://github.com/haya14busa/incsearch.vim) 
  * This will auto enable and disable the search highlight
* ['tpope/repeat.vim'](https://github.com/tpope/vim-repeat) 
* ['airblade/vim-rooter'](https://github.com/airblade/vim-rooter)
* ['tomtom/tcomment_vim'](https://github.com/tomtom/tcomment_vim)
* ['norcalli/nvim-colorizer.lua'](https://github.com/norcalli/nvim-colorizer.lua)
  * to replace ['chrisbra/Colorizer'](https://github.com/chrisbra/Colorizer)
* ['justinmk/vim-sneak'](https://github.com/justinmk/vim-sneak)
* ['karb94/neoscroll.nvim'](https://github.com/karb94/neoscroll.nvim)
  * to replace ['psliwka/vim-smoothie'](https://github.com/psliwka/vim-smoothie)


## Removed plugins:
* ['junegunn/limelight.vim'](https://github.com/junegunn/limelight.vim)
* ['junegunn/goyo.vim'](https://github.com/junegunn/goyo.vim)
* ['dansomething/vim-hackernews'](https://github.com/dansomething/vim-hackernews)

## Notable keybindings and examples from plugins
* gcc : toggle comment for corrent line, from tcomments
* z : to invoke sneak with operator)

## Modified keybindings:
* Use \<space\> key as leader key
* Use \<leader\>th and \<leader\>tk to change two split windows from vert to horiz and from horiz to vert respectively
* Use ctrl + +/- and ctrl + ,. keys to resize windows 
* Use ctrl + hjkl to navigate between windows
* Use s and S for vim-sneak motions. cl is equivalent to s in vim, same as cc to S. Replace f/F/t/T with sneak's single character search. Use z with operators.
* Mouse scrolling is now equivalent to  Neoscroll's \<C-u\> and \<C-d\> for better responsiveness.

## After installation:
* Install extensions for Coc
* Install [Neovide](https://github.com/neovide/neovide) (recommended if you need a vim gui)
  * Run it with arugment `--multigrid` to let Neovide to take control of scrolling animation. Neovide is much smoother than Neovim running in terminals.

## Credits
* Original [Optixal's Neovim.init.vim](https://github.com/Optixal/neovim-init.vim/)
