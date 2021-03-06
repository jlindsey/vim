" Unite

let g:unite_enable_start_insert = 1
let g:unite_enabled_short_source_names = 1
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = 'botright'
let g:unite_update_time = 300
let g:unite_source_file_mru_limit = 100
let g:unite_cursor_line_height = 'CursorLine'
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''
let g:unite_prompt = '➜ '
let g:unite_source_session_enable_autosave = 1
" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'ignore_pattern', join([
  \ '\.git/',
  \ 'git5/.*/review/',
  \ 'google/obj/',
  \ 'tmp/',
  \ 'lib/Cake/',
  \ 'node_modules/',
  \ 'vendor/',
  \ 'Vendor/',
  \ 'app_old/',
  \ 'acf-laravel/',
  \ 'plugins/',
  \ 'bower_components/',
  \ '.sass-cache',
  \ 'web/wp',
  \ ], '\|'))

" Use ag or ack as grep command if possible
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore-case --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts =
  \ '--no-heading --no-color -H'
  let g:unite_source_grep_recursive_opt = ''
endif

nno [unite] <Nop>
nmap f [unite]

nno <silent> <C-p> :Unite -buffer-name=files buffer file_rec/async<cr>
nno <silent> [unite]/ :<C-u>Unite grep:.<cr>
nno <silent> [unite]y :<C-u>Unite history/yank<cr>
nno <silent> [unite]t :<C-u>UniteTodoAddSimple<cr>
nno <silent> [unite]T :<C-u>UniteTodoAddBuffer<cr>

" Function that only triggers when unite opens
au FileType unite call s:unite_settings()
function! s:unite_settings()
  " exit with esc
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
  " Ctrl jk mappings
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  imap <buffer> <c-k> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  " jj kk becuase you're lazy, and leave insert mode
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> kk <Plug>(unite_insert_leave)
  " qq `` becuase you're lazy, and quit unite
  imap <buffer> qq <Plug>(unite_exit)
  imap <buffer> `` <Plug>(unite_exit)
  " refresh unite
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  " split control
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

