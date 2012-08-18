" a text object for parts of a path (between /'s)
function! s:InnerPathTextObject(c, m)
	exec 'silent! normal! F/lv'.a:c.'t/'
	if a:m == "v"
		silent! call repeat#set("\<Plug>VIPathTxtObj", a:c)
	elseif a:m == "o"
		silent! call repeat#set("\<Plug>IPathTxtObj", a:c)
	endif
endfunction

function! s:APathTextObject(c, m)
	exec 'silent! normal! F/lv'.a:c.'f/'
	if a:m == "v"
		silent! call repeat#set("\<Plug>VAPathTxtObj", a:c)
	elseif a:m == "o"
		silent! call repeat#set("\<Plug>APathTxtObj", a:c)
	endif
endfunction

vnoremap <silent> <script> <Plug>VIPathTxtObj :<C-U>call <SID>InnerPathTextObject(v:count1, "v")<CR>
onoremap <silent> <script> <Plug>IPathTxtObj :<C-U>call <SID>InnerPathTextObject(v:count1, "o")<CR>
vnoremap <silent> <script> <Plug>VAPathTxtObj :<C-U>call <SID>APathTextObject(v:count1, "v")<CR>
onoremap <silent> <script> <Plug>APathTxtObj :<C-U>call <SID>APathTextObject(v:count1, "o")<CR>

vmap <silent> i/ <Plug>VIPathTxtObj
omap <silent> i/ <Plug>IPathTxtObj
vmap <silent> a/ <Plug>VAPathTxtObj
omap <silent> a/ <Plug>APathTxtObj

" /this/is/a/path/for/testing/purposes/yo/
" /this/is/a/path/for/testing/purposes/yo/
