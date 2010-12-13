" tailtab.vim
" Author: Girish Venkatachalam girish1729@gmail.com
" Description: 
"  A simple way to observe the new lines getting appended to text file
"  and also moving up and down the buffer.
"  
"  The requirement hopefully fulfilled by this script is that of
"  viewing multiple log files simultaneously
" 
"  This will work on vim 7.0 and above
" License: Public domain
"
" Do whatever you want with it! 
"
" Usage is :TailView file1 file2 ... fileN
"
" The log files or whatever files you want to observe for changes
" are updated automatically when you go that particular tab either
" using the 'gt' command in normal mode or any other way
" 
" You can also manually update them with the <Ctrl-K> hotkey
"
" Note that the log files are opened in read only mode
" And the file updation also happens only for files opened with 
" the TailView command.

" In other words, your normal vim editing is not affected in any
" way while using TailView plugin
"
" You can also at any time add new files with the same command
" Each file will open a new tab, so obviously this plugin
" works only on vim versions above 7.0
"
" Enjoy!

if exists('loaded_tailtab') || &cp
	finish
endif

let loaded_tailtab = 1

if v:version < 700
	finish
endif

let s:TailViewFiles = { }

function! s:UpdateView()
	if has_key(s:TailViewFiles,bufname('%'))
		exe 'view %'
	endif
endfunction

function! s:TailUpdate(file)
	tabnew
	exe 'view'. a:file
	nmap <buffer> <c-k> :view %<CR>

endfunction

function! s:TailView(arg,...)
	call s:TailUpdate(a:arg)
	let s:TailViewFiles = { a:arg : 'dummy' }
	let index = 1
	while index <= a:0
	      call s:TailUpdate(a:{index})
	      call extend(s:TailViewFiles,{ a:{index} : 'dummy' })
	      let index += 1
	endwhile
endfunction

autocmd! BufEnter * call s:UpdateView()
command! -nargs=* -complete=file TailView call s:TailView(<f-args>)
