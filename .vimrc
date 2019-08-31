call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-cursorword'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-buftabline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

let g:javascript_plugin_jsdoc = 1
"sick colors
syntax on
colorscheme monokai
highlight Normal ctermfg=grey ctermbg=black
highlight Visual ctermfg=white ctermbg=red
"show numbers on side
set number
set relativenumber
"softtabstop corresponds to amount of spaces put in when 'tab' is pressed, expandtab turns 'tab' into spaces
set tabstop=8 softtabstop=2 expandtab shiftwidth=2 smarttab smartindent
"highlight entire line that cursor is on
set cursorline
hi CursorLine gui=underline cterm=underline ctermbg=none
"highlight corresponding brackets
set showmatch
"highlight as characters are typed and also highlight matches
set incsearch
set hlsearch
nnoremap ,<space> :nohlsearch<CR>
"page up and down with J and K (overwriting some things that I would never use)
:nmap J <PageDown>
:nmap K <PageUp>
"show file name on the bottom
set laststatus=2
set statusline=%f
let g:javascript_plugin_jsdoc = 1
"hide buffers and move between buffers using better commands
set hidden
nnoremap L :bnext<CR>
nnoremap H :bprev<CR>
nnoremap <C-w> :bd<CR>

"add line for 80 character
set colorcolumn=80

function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction

autocmd BufEnter * call SetTerminalTitle()
