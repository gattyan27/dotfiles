if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/home/ichikawa/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/home/ichikawa/.vim/after,/home/ichikawa/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/ichikawa/.vimrc', '/home/ichikawa/.vim/dein/plugins.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/ichikawa/dotfiles/.vim/dein'
let g:dein#_runtime_path = '/home/ichikawa/dotfiles/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/ichikawa/dotfiles/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/ichikawa/.vim,/usr/share/vim/vimfiles,/home/ichikawa/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim,/home/ichikawa/dotfiles/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim81,/home/ichikawa/dotfiles/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/home/ichikawa/.vim/after'
filetype off
