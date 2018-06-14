""""""""""""""""""""""""""""""""""""""
"""""""""""ZhiyuanZhao's vimrc""""""""
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
""""""""""""""""READ.ME"""""""""""""""
""""""""""""""""""""""""""""""""""""""
" 1.git clone https://github.com/gmarik/vundle/git ~/.vim/bundle/vundle
" 3.cp vimrc ~/.vimrc
" 4.run ":BundleInstall" in vim
" 5.cd ~/.vim/bundle/YouCompleteMe
"   ./install.sh --clang-completer (cmake needed)
" 6.

""""""""""""""""""""""""""""""""""""""
"""""""""""""" GLOBAL_CONFIG""""""""""
""""""""""""""""""""""""""""""""""""""
if has("syntax")   				 " syntax on
    syntax on
endif
filetype on  					 " filetype on 
filetype plugin indent on 		 " filetype can use
set nocompatible				 " out of vi compatible mode
"set shell=git
set shell=/bin/bash
colorscheme desert	             " /usr/share/vim/vim73/colors
au WinLeave * set nocursorline nocursorcolumn    " Highlight current line
au WinEnter * set cursorline cursorcolumn
set cursorline 
highlight CursorLine     cterm=NONE ctermbg=grey ctermfg=black guibg=NONE guifg=NONE
"set cursorcolumn
highlight CursorColumn   cterm=NONE ctermbg=grey ctermfg=black guibg=NONE guifg=NONE
let g:mapleader="," 			 " leader key
set backspace=2     	         " use backspace delete
set nobackup					 " No autogenerate backup file
set nowritebackup
set noswapfile   				 
set history=50					 " history commend stored	
set ruler         				 " show the cursor position all the time
set showcmd       				 " display incomplete commands
set showmode					 " display current mode
set incsearch    				 " do incremental searching
set hlsearch					 " highlight search result
set ignorecase				 	 " ignore case while searching if input lower-case
set smartcase					 " search upper-case if input upper-case
set laststatus=2  				 " Always display the status line
set autowrite     				 " Automatically :write before running commands
set confirm       				 " Need confrimation while exit
set fileencodings=utf-8,gb18030,gbk,big5 " file encodings
set encoding=utf-8               " encoding
set autoindent					 " auto indent
set smartindent
set tabstop=4					 " tab stop width
set softtabstop=4				 " softtabstop width
set shiftwidth =4			 	 " auto indent width
set shiftround 			     	 " auto align when input << or >>
set expandtab 					 " auto trans tab into space
set fileformat=unix
set showmatch					 " show match parentheses
set linebreak					 " show whole word when linebreak
set whichwrap=b,s,<,>,[,]		 " cursor can change line when reach the end
set mouse=a					     " enable mouse usage
set number					     " show line number
set relativenumber				 " show relative number
set numberwidth=4                " number width

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>			  
nnoremap <C-h> <C-w>h 			 " use control+hjkl replace control+w+hjkl to change window
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l            
                                 " remind me not to use direction keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

vmap "+y :w !pbcopy<CR><CR>      " use "+y to coppy
nmap "+p :r !pbpaste<CR><CR>     " use "+p to paste
""""""""""""""""""""""""""""""""""""""
"""""""""""""" VUNDLE_CONFIG""""""""""
""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

""""""""""""""""""""""""""""""""""""""
""""""""""""""" BUNDLE_LIST"""""""""""
""""""""""""""""""""""""""""""""""""""
Plugin 'gmarik/vundle'			 " manage all bundles		
Plugin 'scrooloose/nerdtree'     " browse dir and file
Plugin 'Valloric/YouCompleteMe'	 " auto complete and syntastic check
Plugin 'kien/ctrlp.vim'			 " ctrlp-too complex,hah,study later 
Plugin 'Lokaltog/vim-powerline'  " powerline to show many things
Plugin 'Raimondi/delimitMate'    " automatic closing of quotes, parenthesis, brackets, etc  
Plugin 'Yggdroot/indentLine'     " show indent space 
Plugin 'kien/rainbow_parentheses.vim' " rainbow parentheses
Plugin 'klen/python-mode'        " report all python character-<leader>r to run <leader>b to breakpoint 
Plugin 'easymotion/vim-easymotion' " use <leader><leader>motion(wbjklhs)to jump 
"Plugin 'scrooloose/nerdcommenter' " quick comment

filetype on
"""""""""""""""""""""""""""""""""""""
"""""""""""BUNDLE_CONFIG"""""""""""""
"""""""""""""""""""""""""""""""""""""
" nerdTree-|,nt|hjkl|ctrl+hjkl|o|x|i|s|t|P|p|K|J|?|
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif 
                                 " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 
						         " Close vim if the only window left open is a NERDTree
nnoremap <leader>tr :NERDTreeToggle<cr>		 " use <leader>nt call nerdtree
" YouCompleteMe-|,d|C-o|C-i|
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = '/home/zhiyuan/.conda/envs/pytorchSource/bin/python'
let g:ycm_max_num_candidates=10
let g:ycm_max_num_identifier_candidates=5
let g:ycm_auto_trigger=0
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

nnoremap <leader>de :YcmCompleter GoToDefinitionElseDeclaration<CR>
						         "go to definition or declaration
" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set laststatus=2 				 " Always display the status line

" delimitMate

" indentLine
let g:indentLine_color_term=239  " mark color
let g:indentLine_char='┆'          " use  ¦ or ┆  to mark indent space   
let g:indentLine_concealcursor='inc'
let g:indentLine_conceallevel =2 
"let g:indentLine_enable=0

" rainbow parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"nnoremap <leader>rp :RainbowParenthesesToggle 

"" nerd commenter
"let g:NERDSpaceDelims = 1        " Add spaces after comment delimiters by default
"let g:NERDCompactSexyComs = 1    " Use compact syntax for prettified multi-line comments
"let g:NERDDefaultAlign = 'left'  " Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDAltDelims_python = 1     " Set a language to use its alternate delimiters by default
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } 
"                                 " Add your own custom formats or override the defaults
"let g:NERDCommentEmptyLines = 1  " Allow commenting and inverting empty lines (useful when commenting aregion)
""
"let g:NERDTrimTrailingWhitespace = 1 
"                                 " Enable trimming of trailing whitespace when uncommenting
"
"nnoremap <leader>cc :NERDComComment
"                                 " Comment out the current line or text selected in visual mode.
"nnoremap <leader>cn :NERDComNestedComment
"                                 " Same as cc but forces nesting.
"nnoremap <leader>c<space> :NERDComToggleComment
"                                 " Toggles the comment state of the selected line(s). 
"                                 " If the topmost selected line is commented, all selected lines are uncommented and vice versa.
"nnoremap <leader>cm :NERDComMinimalComment
"                                 " Comments the given lines using only one set of multipart delimiters.
"nnoremap <leader>ci :NERDComInvertComment
"                                 " Toggles the comment state of the selected line(s) individually.
"nnoremap <leader>cs :NERDComSexyComment
"                                 " Comments out the selected lines with a pretty block formatted layout.
"nnoremap <leader>cy :NERDComYankComment
"                                 " Same as cc except that the commented line(s) are yanked first.
"nnoremap <leader>c$ :NERDComEOLComment
"                                 " Comments the current line from the cursor to the end of line.
"nnoremap <leader>cA :NERDComAppendComment
"                                 " Adds comment delimiters to the end of line and goes into insert mode between them.
"nnoremap <leader>ca :NERDComAltDelim
"                                 " Switches to the alternative set of delimiters.
"nnoremap <leader>cb :NERDComAlignedComment
"                                 " Same as |NERDComComment| except that the delimiters are aligned down the left side or both sides 
"nnoremap <leader>cu :NERDComUncommentLine
"                                 " Uncomments the selected line(s).

"python mode
let g:pymode_rope=0               " turn off the rope
let g:pymode_warnings=0
let g:pymode_options_max_line_length=129
let g:pymode_options_colorcolumn=0
