let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.blade.php"
autocmd Filetype php setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.blade.php set ft=blade
