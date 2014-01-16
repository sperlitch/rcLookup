" Vim filetype plugin for managing your vimrc
" Last Change:	2014 Jan 15
" Maintainer:	Scott Perlitch <scottperlitch@gmail.com>
" License:	This file is placed in the public domain.

if exists("g:loaded_vimrc")
  finish
endif
let g:loaded_vimrc = 1

let s:save_cpo = &cpo
set cpo&vim

let g:options= { 'compatible': 'behave very Vi compatible (not advisable)', 'cpoptions': 'list of flags to specify Vi compatibility', 'insertmode': 'use Insert mode as the default mode', 'paste': 'paste mode, insert typed text literally', 'pastetoggle': 'key sequence to toggle paste mode' }

function s:searchOption(option)
	silent exec "options" | redraw!
	silent exec "/^".a:option."" | redraw!
	silent exec "normal! \<c-W>L"
endfunction

function s:echoOptionUnderCursor()
	let line= getline(".")
	let option= matchstr(line, 'set \(no\|\)\zs\(\a*\)')
	echo g:options[option]
endfunction


function s:openOptionUnderCursor()
	echo g:options['compatible']
	return
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
"if !hasmapto('<Plug>TypecorrAdd')
"  map <unique> <Leader>a  <Plug>TypecorrAdd
"endif
"noremap <unique> <script> <Plug>TypecorrAdd  <SID>Add
"
"noremenu <script> Plugin.Add\ Correction      <SID>Add
"
"noremap <SID>Add  :call <SID>Add(expand("<cword>"), 1)<CR>

"function s:Add(from, correct)
"  let to = input("type the correction for " . a:from . ": ")
"  exe ":iabbrev " . a:from . " " . to
"  if a:correct | exe "normal viws\<C-R>\" \b\e" | endif
"  let s:count = s:count + 1
"  echo s:count . " corrections now"
"endfunction
