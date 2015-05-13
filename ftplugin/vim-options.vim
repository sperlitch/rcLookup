" Vim filetype plugin for managing your vimrc options
" Last Change:	2014 Jan 15
" Maintainer:	Scott Perlitch <scottperlitch@gmail.com>
" License:	This file is placed in the public domain.

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

if exists("g:loaded_options")
  finish
endif
let g:loaded_options = 1

let s:save_cpo = &cpo
set cpo&vim

if !hasmapto('<Plug>OptionOpen')
  map <buffer> <unique> K  <Plug>OptionOpen
endif
noremap <buffer> <unique> <script> <Plug>OptionOpen  <SID>openOptionUnderCursor

noremenu <script> Plugin.Open\ Option      <SID>openOptionUnderCursor

noremap <buffer> <SID>openOptionUnderCursor  :call <SID>openOptionUnderCursor()<CR>

function s:searchOption(option)
	silent exec "options" | redraw!
	silent exec "/^".a:option."" | redraw!
	silent exec "normal! \<c-W>L"
endfunction

function s:openOptionUnderCursor()
	let line= getline(".")
	let option=matchstr(line, 'set \(no\|\)\zs\(\a*\)')
	if option == ''
		let option=matchstr(line, '\" \zs\(.*\)')
	endif
	silent exec "call s:searchOption(\'".option."\')"
endfunction

if !exists(":OpenOption")
  command OpenOption  :call s:openOptionUnderCursor()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
