" NOTE: This script depends on the imaps.vim script found in latex-suite.

" Various pairs. Opening makes closing match with markers, but open and close
" acts as normal.
"call IMAP("(", "(<++>)<++>\<Esc>F)i", "")
"call IMAP("()", "(\<Esc>ld5la)", "")
"call IMAP("{", "{<++>}<++>\<Esc>F}i", "")
"call IMAP("{", "\<cr>{\<cr><++>\n}\n<++>\<Esc>kkkk\<c-j>", "php")
"call IMAP("{}", "{\<Esc>ld5la}", "")
"call IMAP("[", "[<++>]<++>\<Esc>F]i", "")
"call IMAP("[]", "[\<Esc>ld5la]", "")
"call IMAP("'", "'<++>'<++>\<Esc>F'i", "")
"call IMAP("''", "'\<Esc>ld5la'", "")
"call IMAP("\"", "\"<++>\"<++>\<Esc>F\"hi", "")
"call IMAP("\"\"", "\"\<Esc>ld5la\"", "")

"call IMAP("\"", "\<C-r>=QuoteOnlyAfterSpace(\"\\\"\")\<CR>", "")
"call IMAP("\"\"", "\<C-r>=DoubleQuoteOnlyAfterSpace(\"\\\"\")\<CR>", "")

"call IMAP("'", "\<C-r>=QuoteOnlyAfterSpace(\"'\")\<CR>", "")
"call IMAP("''", "\<C-r>=DoubleQuoteOnlyAfterSpace(\"'\")\<CR>", "")

" Wrap selected region in quotes/brackets.
vnoremap <silent> '' :call VEnclose("'", "'", "", "")<CR>
vnoremap <silent> "" :call VEnclose("\"", "\"", "", "")<CR>
vnoremap <silent> (( :call VEnclose("(", ")", "", "")<CR>
vnoremap <silent> [[ :call VEnclose("[", "]", "", "")<CR>
vnoremap <silent> {{ :call VEnclose("{", "}", "", "")<CR>

":imap <expr>  <tab> (col('.')==col('$'))?";\<cr>": "\<tab>"
":imap <expr>  <c-j> (col('.')==col('$'))?";\<cr>": "\<c-j>"

func! InsertTabWrapper(dir)
    let col = col('.') - 1
    " if at the start of a line
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    endif

    if( a:dir == "prev" )
      return "\<c-p>"
    else
      return "\<c-n>"
    endif
endfunction

" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper("next")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper("prev")<cr>



" Miscellaneous functions.
function! QuoteOnlyAfterSpace(tchar)
    let lastchar = strpart(getline("."), col(".")-2,1)
    if (lastchar == " " || lastchar == "(")
        return IMAP_PutTextWithMovement(a:tchar . a:tchar . "<++>\<Esc>F" . a:tchar . "i")
    else
        return a:tchar
    endif
endfunction

function! DoubleQuoteOnlyAfterSpace(tchar)
    let lastchar = strpart(getline("."), col(".")-2,1)
    if (lastchar == " " || lastchar == "(")
        return IMAP_PutTextWithMovement(a:tchar . "\<Esc>ld5la" . a:tchar)
    else
        return a:tchar . a:tchar
    endif
endfunction

