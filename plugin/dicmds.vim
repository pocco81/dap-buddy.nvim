
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
" aa = available arguments

function! dicmds#available_args_install() abort
	return luaeval('require("dap-install.ui.cli.completion.aa_install").available_commands()')
endfunction

function! dicmds#available_args_uninstall() abort
	return luaeval('require("dap-install.ui.cli.completion.aa_uninstall").available_commands()')
endfunction
" }}}

" Tab Completion {{{
function! s:complete_args_install(arg, line, pos) abort
	return join(dicmds#available_args_install(), "\n")
endfunction

function! s:complete_args_uninstall(arg, line, pos) abort
	return join(dicmds#available_args_uninstall(), "\n")
endfunction
" }}}


" Interface {{{
command! -nargs=+ -complete=custom,s:complete_args_install DIInstall call v:lua.require("dap-install.main").main(0,dicmds#get_first_arg(<f-args>))
command! -nargs=+ -complete=custom,s:complete_args_uninstall DIUninstall call v:lua.require("dap-install.main").main(1,dicmds#get_first_arg(<f-args>))
command! -nargs=0 DIList call v:lua.require("dap-install.main").main(2)
" }}}


let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

" set to true the var that controls the plugin's loading
let g:loaded_dap_install = 1

