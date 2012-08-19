" a text object for parts of a path (between /'s)
function! s:PathTextObject(c, o, m)
	let o = (a:o == "a" ? "f" : "t")
	let m = (a:m == "v" ? "V" : "")
	exec 'silent! normal! F/lv'.a:c.o.'/'
	silent! call repeat#set("\<Plug>".m.toupper(a:o)."PathTxtObj", a:c)
endfunction

vnoremap <silent> <script> <Plug>VIPathTxtObj :<C-U>call <SID>PathTextObject(v:count1, "i", "v")<CR>
onoremap <silent> <script> <Plug>IPathTxtObj :<C-U>call <SID>PathTextObject(v:count1, "i", "o")<CR>
vnoremap <silent> <script> <Plug>VAPathTxtObj :<C-U>call <SID>PathTextObject(v:count1, "a", "v")<CR>
onoremap <silent> <script> <Plug>APathTxtObj :<C-U>call <SID>PathTextObject(v:count1, "a", "o")<CR>

vmap <silent> i/ <Plug>VIPathTxtObj
omap <silent> i/ <Plug>IPathTxtObj
vmap <silent> a/ <Plug>VAPathTxtObj
omap <silent> a/ <Plug>APathTxtObj

" /this/is/a/path/for/testing/purposes/yo/
" /this/is/a/path/for/testing/purposes/yo/
