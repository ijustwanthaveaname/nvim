lua require('lsp/setup')
set background=dark
colorscheme zephyr
let g:kite_tab_complete=1
let mapleader=" "
call plug#begin('~/.vim/plugged')
lua require('keybindings')
lua require('plugins')
lua require('zephyr')
lua require('plugin-config/bufferline')
lua require("plugin-config/lualine")
lua require('plugin-config/nvim-tree')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }
Plug 'tell-k/vim-autopep8'
Plug 'dense-analysis/ale'
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
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
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
map <A-m> :NERDTreeMirror<CR>
map <A-m> :NERDTreeToggle<CR>
map <A-s> :split<CR>
map <A-v> :vsplit<CR>
map <F1> :NvimTreeToggle<CR>
map <F7> :vsplit term://zsh<CR>
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
nmap <space>b :w !lua<CR>
vmap <space>m :'<,'>w !zsh<CR>
" nmap <F2> :Defx<CR>
nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
" let g:airline_theme='dracula'
" let g:airline#extension#tabline#buffer_nr_show=1
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
tnoremap <ESC> <C-\><C-n>
inoremap <C-o> <End><CR>
set encoding=utf-8
set guifont=DroidSansMono_Nerd_Font:h11
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set ma

" markdown settings
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

nmap <C-v> :MarkdownPreview<CR>
nmap <M-v> :MarkdownPreviewStop<CR>
nmap <C-i> :MarkdownPreviewToggle<CR>
