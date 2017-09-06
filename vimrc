let mapleader = ","

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" APPEARANCE
syntax on
set background=dark
colorscheme solarized

set nowrap
set formatprg=par\ -e\ -r
set linebreak
set colorcolumn=80

set title
set visualbell
set showcmd
set relativenumber
set number
set cursorline
set shortmess=a
set cmdheight=2
set lazyredraw
set matchpairs+=<:>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Powerline font choices, ranked by preferences. Test: 0oO 1li 
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10 "really nice
" set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12 "really nice
"set guifont=Meslo\ LG\ S\ for\ Powerline
"set guifont=Anonymous\ Pro\ for\ Powerline
"set guifont=Liberation\ Mono\ for\ Powerline "nice, clean
"set guifont=Inconsolata\ for\ Powerline "smaller v of above
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline "fine, clean
"set guifont=Sauce\ Code\ Powerline
"set guifont=Fira\ Mono\ for\ Powerline "serify
"set guifont=monofur\ for\ Powerline
"set guifont=Droid\ Sans\ Mono\ for\ Powerline "quite nice, compact, but 0 and O a bit hard to distinguish

" alternatives
"set guifont=Inconsolata\-g\ for\ Powerline "thin, a bit serify
"set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline "fairly nice, somewhat serif
"set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline "nicer, less tall

" show trailing whitespace
set list listchars=tab:\ \ ,trail:·

" INDENTATION
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" PERSISTENT UNDO
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" TEMPFILES
silent !mkdir ~/.vim/temp > /dev/null 2>&1
set backupdir=~/.vim/temp
set directory=~/.vim/temp

" SCROLLING
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" FOLDING
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "don't fold by default

" BUFFERS
set hidden " allow hiding a buffer without saving changes

" MISC --------------------------------------------------------------

set history=1000      "store lots of commandline history

" jump to the column saved in a mark, not just the line
nnoremap ' `
nnoremap ` '

runtime macros/matchit.vim "`%` jumps between more open/close delimiters

set wildmenu               "show me possible tab-completions
set wildmode=list:longest  "complete up to the point of ambiguity

" perform case-sensitive searches only if the keyword has uppercase
set ignorecase
set smartcase

nmap <silent> // :silent :nohlsearch<CR>

set autoread               "automatically reload changes

"save a SHIFT keypress for commands
nmap ; :

set guioptions=aegit

set tags=./tags;~

set nomodeline				"security risk

" for the detectindent plugin
let g:detectindent_preferred_indent=4
autocmd BufReadPost * :DetectIndent

noremap <leader><leader>u :GundoToggle<CR>

" recommended beginner syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" use eslint if appropriate
function! s:hasEslint()
	if findfile('.eslintrc', '.;') != ''
		return ['eslint']
	elseif findfile('.eslintrc.json', '.;') != ''
		return ['eslint']
	else
		return  ['standard']
	endif
endfunction

" use eslint if appropriate
function! s:setJavaScriptChecker()
	echo "checking"
	if findfile('.eslintrc', '.;') != '' 
				\ || findfile('.eslintrc.js', '.;') != '' 
				\ || findfile('.eslintrc.json', '.;') != ''
		let b:syntastic_checkers = ['eslint']
		let b:syntastic_javascript_eslint_exec = getcwd() . '/node_modules/.bin/eslint'
	else
		echo "standard"
		let b:syntastic_checkers = ['standard']
	endif
endfunction

autocmd FileType javascript call s:setJavaScriptChecker()

" replace default vim search with easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase=1

" javascript plugin
let g:javascript_enable_domhtmlcss=1
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_ngdoc=1
let g:javascript_conceal_function       = "ƒ"
" let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
" let g:javascript_conceal_undefined      = "¿"
" let g:javascript_conceal_NaN            = "ℕ"
" let g:javascript_conceal_prototype      = "¶"
" let g:javascript_conceal_static         = "•"
" let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips/local"
let g:UltiSnipsSnippetDirectories=["ultisnips/local"]
let g:UltiSnipsEditSplit="horizontal"
imap <c-space> <C-R>=UltiSnips#ExpandSnippetOrJump()<CR>
autocmd BufNewFile,BufReadPost *.snippets set noexpandtab tabstop=2

" seems like having this at the end of the file might be important for some
" plugins to work properly 
filetype plugin indent on

set noshowmode

let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" fix up html indenting
" to change these live, call HtmlIndent_CheckUserSettings() afterward
let g:html_indent_script1="inc" " or auto
let g:html_indent_style1="inc" " or auto
let g:html_indent_inctags="body,head,md-card"
let g:html_indent_autotags=""   " tags to NOT indent?

" ctrlp
let g:ctrlp_custom_ignore='dist\|node_modules\|bower_components\|\v[\/]\.(git|hg)'
noremap <leader>dp :CtrlPClearCache<CR>
noremap <leader>dP :CtrlPClearAllCaches<CR>

" easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" automatically strip whitespace when writing files
autocmd BufWritePre *.coffee,*.rb,*.js,*.json :%s/\s\+$//e

" ledger settings
autocmd BufNewFile,BufReadPost *.ledger.txt set noexpandtab shiftwidth=8 tabstop=8 softtabstop=8 filetype=ledger
autocmd BufNewFile,BufReadPost *.js,*.sh set expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Ack
noremap <Leader>a :Ack <cword><cr>   " search word under cursor

" Syntastic
let g:syntastic_html_tidy_ignore_errors=["malformed URI", "lacks \"alt", "plain text", "is not recognized", "proprietary attribute", "discarding unexpected"]

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" sometimes Syntastic is annoying because the code it's checking is crap
function! s:toggleSyntastic()
	call SyntasticToggleMode()
	windo lcl\|ccl
endfunction
noremap <leader>st :call <SID>toggleSyntastic()<CR>



