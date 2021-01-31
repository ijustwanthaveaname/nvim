let g:kite_tab_complete=1
let mapleader=" "
call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons'
Plug 'puremourning/vimspector', {'do': './install_gadget.py --all'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-match-highlight'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-markdown-subscope'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
if has('nvim')
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/defx.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'theniceboy/vim-deus'
Plug 'dracula/vim'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf.vim'
call plug#end()
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
set nu
let NERDTreeShowHidden=1
map <F1> :NERDTreeMirror<CR>
map <F1> :NERDTreeToggle<CR>
let g:coc_explorer_global_presets = {
			\   '.vim': {
			\     'root-uri': '~/.vim',
			\   },
			\   'cocConfig': {
			\      'root-uri': '~/.config/coc',
			\   },
			\   'tab': {
			\     'position': 'tab',
			\     'quit-on-open': v:true,
			\   },
			\   'floating': {
			\     'position': 'floating',
			\     'open-action-strategy': 'sourceWindow',
			\   },
			\   'floatingTop': {
			\     'position': 'floating',
			\     'floating-position': 'center-top',
			\     'open-action-strategy': 'sourceWindow',
			\   },
			\   'floatingLeftside': {
			\     'position': 'floating',
			\     'floating-position': 'left-center',
			\     'floating-width': 50,
			\     'open-action-strategy': 'sourceWindow',
			\   },
			\   'floatingRightside': {
			\     'position': 'floating',
			\     'floating-position': 'right-center',
			\     'floating-width': 50,
			\     'open-action-strategy': 'sourceWindow',
			\   },
			\   'simplify': {
			\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
			\   },
			\   'buffer': {
			\     'sources': [{'name': 'buffer', 'expand': v:true}]
			\   },
			\ }

" Use preset argument to open it
nmap <space>ed :CocCommand explorer --preset .vim<CR>
nmap <space>ef :CocCommand explorer --preset floating<CR>
nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
nmap <space>eb :CocCommand explorer --preset buffer<CR>
nmap <space>e :CocCommand explorer<CR>
" List all presets
nmap <space>el :CocList explPresets
nmap <space>n :w !python<CR>
vmap <space>n :'<,'>w !python<CR>
nmap <space>m :w !zsh<CR>
" nmap <F2> :Defx<CR>
nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
let g:airline_theme='dracula'
let g:airline#extension#tabline#buffer_nr_show=1
color deus
"vim-commentary
""为python和shell等添加注释
autocmd FileType python,shell,coffee set commentstring=#\ %s
"修改注释风格
autocmd FileType java,c,cpp set commentstring=//\ %s
autocmd FileType apache setlocal commentstring=#\ %s
" ncm2配置
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
noremap <C-g> :bn<CR>
noremap <C-f> :bp<CR>
noremap <C-p> :Files<CR>
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer'),
			\ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad
noremap <C-l> :VimspectorReset<CR>
noremap <C-j> :call vimspector#StepInto()<CR>
noremap <C-k> :call vimspector#StepOver()<CR>
noremap <C-s> :w<CR>
noremap <LEADER><CR> :nohlsearch<CR>
inoremap <S-o> <End><CR>
set encoding=utf-8
set guifont=DroidSansMono_Nerd_Font:h11
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
