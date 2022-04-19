" GPL-3.0 License

if exists('g:loaded_dap_buddy') | finish | endif
let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

function! s:ParseArgs(args)
    if len(a:args) == 0
        return { 'debuggers': [] }
    endif
    return { 'debuggers': a:args }
endfunction

function! s:DBInstallCompletion(...) abort
    return join(sort(luaeval("require'dap-buddy'.get_install_completion()")), "\n")
endfunction

function! s:DBUninstallCompletion(...) abort
    return join(sort(luaeval("require'dap-buddy'.get_uninstall_completion()")), "\n")
endfunction

function! s:DBInstall(args) abort
    let parsed_args = s:ParseArgs(a:args)
	for debugger_name in l:parsed_args.debuggers
		call luaeval("require'dap-buddy'.install(_A)", debugger_name)
	endfor
endfunction

function! s:DBUninstall(args) abort
    let parsed_args = s:ParseArgs(a:args)
	for debugger_name in l:parsed_args.debuggers
		call luaeval("require'dap-buddy'.uninstall(_A)", debugger_name)
	endfor
endfunction

function! s:DBInfo() abort
    lua require'dap-buddy'.info_window.open()
endfunction

command! -bar -nargs=* -complete=custom,s:DBInstallCompletion		DBInstall call s:DBInstall([<f-args>])
command! -bar -nargs=+ -complete=custom,s:DBUninstallCompletion		DBUninstall call s:DBUninstall([<f-args>])
command! DBInfo call s:DBInfo()

let g:loaded_dap_buddy = v:true
let &cpo = s:save_cpo
unlet s:save_cpo
