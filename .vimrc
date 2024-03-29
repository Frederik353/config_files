set history=1000



map <Space> <Leader>

" Fast saving
nnoremap <Leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set soscrolloff=7

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

set gdefault

set clipboard = unnamedplus

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs

noremap <Leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
" noremap <Leader>tp :tabprev<cr>
" noremap <Leader>tn :tabnext<cr>
noremap <leader>tm :tabmove
noremap <Leader>tt :tabnew<CR>


nmap H ^
nmap L g_

nmap K 5k
nmap J 5j
nnoremap <Leader>j J

imap jk <Esc>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



