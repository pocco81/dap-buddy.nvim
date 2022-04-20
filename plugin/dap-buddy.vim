" GPL-3.0 License

if exists('g:loaded_dap_buddy') | finish | endif
let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

let s:no_confirm_flag = "--no-confirm"
let s:TITLE = "[dap-buddy]: "

function! s:Notify(msg, level="i")
	call luaeval("require'dap-buddy.notify'.m('" . a:msg . "', '" . a:level . "')")
endfunction

function! s:ParseArgs(args, flags=[])
    if len(a:args) == 0
        return { 'flags': [], 'debuggers': [] }
    endif
	let l:flags = []
	for arg in a:flags
		let l:pos = index(a:args, arg)
		if pos >= 0
			call remove(a:args, l:pos)
			call add(l:flags, arg)
		endif
	endfor
    return { 'flags': l:flags, 'debuggers': a:args }
endfunction

function! s:DBInstallCompletion(...) abort
    return join(sort(luaeval("require'dap-buddy'.get_install_completion(true)")), "\n")
endfunction

function! s:DBUninstallCompletion(...) abort
    return join(sort(luaeval("require'dap-buddy'.get_uninstall_completion(true)")), "\n")
endfunction

function! s:DBInstall(args) abort
    let parsed_args = s:ParseArgs(a:args, ['--sync', '--no-confirm'])
	if empty(parsed_args.debuggers)
		call s:Notify("no debuggers were provided", "w")
		return
	endif

	if index(parsed_args.debuggers, "all") >= 0
		if index(parsed_args.flags, "--no-confirm") == -1
			let l:confirmation = confirm(s:TITLE . "are you sure you want to install them all?", "&Yes\n&No", 2)
			if l:confirmation != 1
				return 0
			endif
		endif
		let parsed_args.debuggers = luaeval("require'dap-buddy'.get_install_completion()")
	endif

    if index(parsed_args.flags, "--sync") >= 0
        call luaeval("require'dap-buddy'.install(_A, 'sync')", parsed_args.debuggers)
    else
		for debugger_name in l:parsed_args.debuggers
			call luaeval("require'dap-buddy'.install(_A)", debugger_name)
		endfor
    endif
endfunction

function! s:DBUninstall(args) abort
    let parsed_args = s:ParseArgs(a:args, ['--sync'])
	if empty(parsed_args.debuggers)
		call s:Notify("no debuggers were provided", "w")
		return
	endif

    if index(parsed_args.flags, '--sync') >= 0
        call luaeval("require'dap-buddy'.uninstall(_A, 'sync')", parsed_args.debuggers)
    else
        for debugger_name in l:parsed_args.debuggers
            call luaeval("require'dap-buddy'.uninstall(_A)", debugger_name)
        endfor
    endif
endfunction

function! s:DBInfo() abort
    lua require'dap-buddy'.info_window.open()
endfunction

command! -bar -nargs=+ -complete=custom,s:DBInstallCompletion		DBInstall call s:DBInstall([<f-args>])
command! -bar -nargs=+ -complete=custom,s:DBUninstallCompletion		DBUninstall call s:DBUninstall([<f-args>])
command! DBInfo call s:DBInfo()

let g:loaded_dap_buddy = v:true
let &cpo = s:save_cpo
unlet s:save_cpo
