" .vim/autoload/local/zettel.vim
func! local#zettel#edit(...)

  " build the file name
  let l:sep = ''
  if len(a:000) > 0
    let l:sep = '-'
  endif
  let l:fname = expand('~/Nextcloud/Zettelkasten/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'

  " edit the new file
  exec "e " . l:fname

  " enter the title and timestamp (using ultisnips) in the new file
  if len(a:000) > 0
    exec "normal ggO\<c-r>=strftime('%Y-%m-%d %H:%M')\<cr> " . join(a:000) . "\<cr>\<esc>G"
  else
    exec "normal ggO\<c-r>=strftime('%Y-%m-%d %H:%M')\<cr>\<cr>\<esc>G"
  endif
endfunc
