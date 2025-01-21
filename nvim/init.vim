" Set leader key
let mapleader = " "

set number
set relativenumber

" Open Ex mode (file explorer)
nnoremap <leader>tr :Lexplore!<CR>

nnoremap <leader>n :tabnew <C-R>=input('Enter filename: ')<CR><CR>

nmap <Tab> :tabn<CR>
nmap <S-Tab> :tabp<CR>

" Move selected text up or down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Join lines in normal mode, preserving cursor position
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Greatest remap ever (paste without modifying the clipboard)
xnoremap <leader>p "_dP

" Copy to system clipboard in normal or visual mode
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" Delete to void register without affecting the clipboard
xnoremap <leader>d "_d
nnoremap <leader>d "_d

" Remap <C-c> to Esc in insert mode (to avoid conflicts)
inoremap <C-c> <Esc>

" Open tmux sessionizer in a new tmux window
nnoremap <C-f> :silent !tmux neww tmux-sessionizer<CR>

" Navigate quickfix and location lists while centering the screen
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

" Search and replace word under cursor globally in the file
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Make the current file executable
nnoremap <leader>x :!chmod +x %<CR>

" Source the init.vim file to reload configurations
nnoremap <leader><leader> :so ~/.config/nvim/init.vim<CR>

" Run current Python file in terminal
nnoremap <leader>py :w<CR>:term python3 %<CR>

" Run Rust code
nnoremap <leader>rr :RustRun<CR>
nnoremap <leader>cb :w<CR>:!cargo build<CR>
nnoremap <leader>cr :term cargo run<CR>
nnoremap <leader>rc :w<CR>:term gcc % && ./a.out<CR>
nnoremap <leader>cp :w<CR>:term g++ % && ./a.out<CR>
nnoremap <leader>rf :w<CR>:!rustc % -o ./<C-R>=expand('%:t:r')<CR> && ./<C-R>=expand('%:t:r')<CR><CR>

