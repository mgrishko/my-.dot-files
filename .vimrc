source ~/.vim/vimrc "Собственно, подцепить все настройки от Akita
"В Windows вместо строчки выше надо вбить %HOME%\vimfiles\vimrc
colorscheme vibrantink "Приятная цветовая схема в стиле TexMate
set nu "Отображать номер астрок
set sw=2 "Заменяет TAB на 2 пробела
set sts=2 "Аналогично, но в случае автоотступа
let g:fuzzy_ignore = "gems/*"
"<F5> - running script
nmap  <S-F5> <esc>:rubyf %<cr>
"tpope gist for tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
    if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
      let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
      let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
      Tabularize/|/l1
      normal! 0
      call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
    endif
endfunction
"Чтобы при вставке текста из буфера не получить кучу ненужных нам отступов
"Вешаем на F5 вкл/выкл режима вклейки:
"Отключаем режим вклейки - вставляем текст, включаем режим снова.
:set pastetoggle=<F12>
"удалить все пустые строки
map <F9> :g/^$/d
"Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
