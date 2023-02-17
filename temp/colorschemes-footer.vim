    \]

function! s:rand_int(n) abort
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:]) % a:n
endfunction

function! s:has_colorscheme(name) abort
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&runtimepath, pat))
endfunction

function s:lin_next_color(update, ...)
    " echom 'a:0:' . string(a:0) . ', a:000:' . string(a:000)
    if a:0 > 0
        " echom 'a:1:' . string(a:1)
        let color = a:1
        if s:has_colorscheme(color)
            execute 'colorscheme ' . color
        else
            " execute 'normal! \<Esc>'
            echohl ErrorMsg
            echomsg 'Error: unknown colorscheme: ' . color . ', fallback to default!'
            echohl None
            execute 'colorscheme default'
        endif
    else
        if len(s:colors) > 0
            let idx = s:rand_int(len(s:colors))
            execute 'colorscheme ' . s:colors[idx]
        else
            " execute 'normal! \<Esc>'
            echohl ErrorMsg
            echomsg 'Error: no colorscheme installed, check `~/.nvim/colorschemes.vim`!'
            echohl None
        endif
    endif
    if a:update
        execute 'diffupdate'
        execute 'syntax sync fromstart'
    endif
endfunction

command! -bang -nargs=? NextColor call s:lin_next_color(<bang>0, <f-args>)
