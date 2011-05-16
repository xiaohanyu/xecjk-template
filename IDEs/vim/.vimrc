let do_syntax_sel_menu = 1 | runtime! synmenu.vim 
augroup filetypedetect
au BufNewFile,BufRead *.asm setf masm
augroup END

" 设置字符编码。参考：http://www.rainux.org/blog/index.php/2005/10/20/106

" encoding: Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文
" 本、消息文本等。用户手册上建议只在 .vimrc 中改变它的值，事实上似乎也只有
" 在 .vimrc 中改变它的值才有意义。
"
" 由于 Unicode 能够包含几乎所有的语言的字符，而且 Unicode 的 UTF-8 编码方式
" 又是非常具有性价比的编码方式 (空间消耗比 UCS-2 小)，因此建议 encoding 的
" 值设置为 utf-8。这么做的另一个理由是 encoding 设置为 utf-8 时，Vim 自动探
" 测文件的编码方式会更准确 (或许这个理由才是主要的)。
set encoding=utf-8

" fileencodings: Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文
" 件的字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。因
" 此最好将 Unicode 编码方式放到这个列表的最前面。
"
" 拉丁语系编码方式 latin1 最好去掉。因为如果有 latin-1，在文件中有多种编码
" 方式的内容时 (比如，a 为 utf-8 编码的中文文本文件，b 为 cp936 编码的中文
" 文本文件，执行命令 cat b >> a 后的 a 文件)，最后 Vim 会将文件编码设为
" latin-1，导致最终非英文内容显示完全乱码。
"set fileencodings=utf-8,chinese,latin-1
set fileencodings=utf-8,chinese

" fileencoding: Vim 中当前编辑的文件的字符编码方式，Vim 保存文件时也会将文
" 件保存为这种字符编码方式。
"
" 如果打开的是已有的文件，则 Vim 会将 fileencoding 设置为上面探测到的字符编
" 码，此处的设置不再有效；如果是新文件，则此处的 fileencoding 生效。
if has("win32")

    " 我们在中文 Windows 里编辑的文件，为了兼顾与其他软件的兼容性，文件编码
    " 还是设置为 GB2312/GBK 比较合适，因此 fileencoding 建议设置为 chinese
    " (chinese 是个别名，在 Unix 里表示 gb2312，在 Windows 里表示 cp936，也
    " 就是 GBK 的代码页)。
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

" termencoding: Vim 所工作的终端 (或者 Windows 的 Console 窗口) 的字符编码
" 方式。这个选项对 GUI 模式的 gVim 无效，而对 Console 模式的 Vim 而言就是
" Windows 控制台的代码页 (对于 Windows 而言)，并且通常我们不需要改变它。
"
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
let &termencoding=&encoding

" 一般而言，在字符编码配置正确的情况下，是不会出现乱码问题的。
" 万一不幸菜单乱码 (比如，locale 设置为 zh_CN.UTF-8 而 encoding 却设置为
" cp936 时。当然，此时最好的方法还是将 encoding 设置为 utf-8) ，请取消下
" 面两行语句的注释。
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme murphy          " 设定背景为夜间模式
filetype plugin on          " 自动识别文件类型，自动匹配对应的
                            " “文件类型Plugin.vim”文件，使用缩进定义文件
set ambiwidth=double        " ambiwidth 默认值为 single。在其值为 single 时，
                            " 若 encoding 为 utf-8，gvim 显示全角符号时就会
                            " 出问题，会当作半角显示。
set autochdir               " 自动切换当前目录为当前文件所在的目录
set autoindent cindent cinoptions=g0
                            " 打开自动缩进和 C 语言风格的缩进模式，
                            " 定制 C 语言缩进风格
set backspace=indent,eol,start
                            " 不设定的话在插入状态无法用退格键和 Delete
                            " 键删除回车符
set backupcopy=yes          " 设置备份时的行为为覆盖

if v:version >= 700
    set completeopt=menu,longest,preview
                            " 自动补全(ctrl-p)时的一些选项：
                            " 多于一项时显示菜单，最长选择，
                            " 显示当前选择的额外信息
endif

set confirm                 " 用确认对话框（对于 gvim）或命令行选项（对于
                            " vim）来代替有未保存内容时的警告信息
set display=lastline        " 长行不能完全显示时显示当前屏幕能显示的部分。
                            " 默认值为空，长行不能完全显示时显示 @。
set expandtab               " 将 tab 键转换为空格
set formatoptions=tcqro     " 使得注释换行时自动加上前导的空格和星号
set hidden                  " 允许在有未保存的修改时切换缓冲区，
                            " 此时的修改由切换由 vim 负责保存
set history=50              " 设置冒号命令和搜索命令的命令历史列表的长度为 50
set hlsearch                " 搜索时高亮显示被找到的文本
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时
                            " 仍保持对大小写敏感
set incsearch               " 输入搜索内容时就显示搜索结果
set mouse=a                 " 设定在任何模式下鼠标都可用
set nobackup                " 覆盖文件时不备份
set nocompatible            " 设定 gvim 运行在增强模式下
set noignorecase            " 默认区分大小写
set nolinebreak             " 在单词中间断行
set number                  " 显示行号
set ruler                   " 打开状态栏标尺
"set scrolloff=5             " 设定光标离窗口上下边界 5 行时窗口自动滚动
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set showcmd                 " 在状态栏显示目前所执行的指令，未完成的指令片段亦
                            " 会显示出来
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
                            " （不足 4 个时删掉所有剩下的空格）
set tabstop=4               " 设定 tab 长度为 4
set whichwrap=b,s,<,>,[,]   " 设定退格键、空格键以及左右方向键在行首行尾时的
                            " 行为，不影响 h 和 l 键
set wrap                    " 自动换行显示
syntax on                   " 自动语法高亮

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置命令行和状态栏

set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ]
                            " 设置在状态行显示的信息如下：
                            " %F    当前文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}
                            "       当前文件编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动命令

" 读文件时自动设定当前目录为刚读入文件所在的目录
autocmd BufReadPost * cd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自定义缩写

function! Eatchar(pat)
    let s:c = nr2char(getchar())
    return (s:c =~ a:pat) ? '' : s:c
endfunction

" C 文件头注释
iab     /**         /<Esc>75a*<Esc>o<Esc>0c$ * <Esc>yyADescrīption:<Esc>pmxpAAuthor  : wplxb<Esc>pALanguage: C<Esc>pADate    : <C-R>=strftime("%Y-%m-%d")<CR><Esc>p$r/74i*<Esc>0vyo<Esc>`x$9pa

" C 注释
iab     ///         /* <Esc>mxa */<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     ***         /*<Esc>yyppr A/<Esc>k0r A <C-R>=Eatchar('\s')<CR>

" C 预处理
iab     #i          #include <<Esc>mxa><Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     #d          #define

" C 关键字
iab     if(         if (<Esc>mxa)<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     el{         else<CR>{<Esc>mxa<CR>}<Esc>`xa<CR><C-R>=Eatchar('\s')<CR>
iab     ie(         if (<Esc>mxa)<CR>{<CR>}<CR>else<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     fo(         for (<Esc>mxa; ; )<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     fi(         for (i = 0; i < <Esc>mxa; ++i)<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     fi1(        for (i = 1; i <= <Esc>mxa; ++i)<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     fj(         for (j = 0; j < <Esc>mxa; ++j)<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     fj1(        for (j = 1; j <= <Esc>mxa; ++j)<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     ma(         int main(int argc, char * argv[])<CR>{<Esc>mxa<CR>}<Esc>`xa<CR><CR>return 0;<Esc>`xa<CR><C-R>=Eatchar('\s')<CR>
iab     wh(         while (<Esc>mxa)<CR>{<CR>}<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     sw(         switch (<Esc>mxa)<CR>{<CR>case <Esc>mya<CR>break;<CR>case <Esc>mza<CR>break;:<Esc>xa<CR>}<Esc>`yp`zp`xa<C-R>=Eatchar('\s')<CR>
iab     sd(         switch (<Esc>mxa)<CR>{<CR>case <Esc>mya<CR>break;<CR>case <Esc>mza<CR>break;<CR>default:<Esc>vya<CR>}<Esc>`yp`zp`xa<C-R>=Eatchar('\s')<CR>

" C 常用库函数
iab     sc(         scanf("<Esc>mxa", );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     fs(         fscanf(<Esc>mxa, "", );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     ss(         sscanf(<Esc>mxa, "", );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     pr(         printf("<Esc>mxa", );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     prn(        printf("<Esc>mxa\n");<Esc>`x<C-R>=Eatchar('\s')<CR>
iab     fp(         fprintf(<Esc>mxa, "", );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     sp(         sprintf(<Esc>mxa, "", );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     cpy(        strcpy(<Esc>mxa, );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     cat(        strcat(<Esc>mxa, );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     len(        strlen(<Esc>mxa);<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     cmp(        strcmp(<Esc>mxa, );<Esc>`xa<C-R>=Eatchar('\s')<CR>
iab     qs(         qsort(<Esc>mxa, , , );<Esc>`xa<C-R>=Eatchar('\s')<CR>

" C++ 常用
iab     co          cout << <Esc>mxa << endl;<Esc>`xa<C-R>=Eatchar('\s')<CR>

iab     ---         <Esc>75A-<Esc>a<C-R>=Eatchar('\s')<CR>

cab     tn          tabnew

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 键映射

nmap    <F12>       :%s,\s\+$,,g<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetypedetect
au BufNewFile,BufRead *.asm setf masm
augroup END

set guioptions-=T

" Set the following lines in your ~/.vimrc or the systemwide /etc/vimrc:
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" Also, this installs to /usr/share/vim/vimfiles, which may not be in
" your runtime path (RTP). Be sure to add it too, e.g:
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
