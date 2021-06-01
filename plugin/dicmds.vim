
" GPL-3.0 License

" prevent the plugin from loading twice
if exists('g:loaded_dap_install') | finish | endif

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

" Utils {{{
function! dicmds#get_first_arg(...)
	return "".get(a:, 1, 1).""
endfunction
" }}}

" Test Availability {{{
function! dicmds#available_args() abort
	return luaeval('require("dap-install.debuggers_list").available_commands()')
endfunction
" }}}

" Tab Completion {{{
function! s:complete_args_tool_highlight(arg, line, pos) abort
	return join(dicmds#available_args(), "\n")
endfunction
" }}}


" Interface {{{
command! -nargs=* -complete=custom,s:complete_smth DIInstall call v:lua.require("dap-install.main").main(0,dicmds#get_first_arg(<f-args>))
" command! -nargs=* -complete=custom,s:complete_smth DIUninstall call v:lua.require("dap-install.main").main(1,dicmds#get_first_arg(<f-args>))
" command! DIList call v:lua.require("dap-install.main").main(0,dicmds#get_first_arg(<f-args>))
" }}}


let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

" set to true the var that controls the plugin's loading
let g:loaded_dap_install = 1

