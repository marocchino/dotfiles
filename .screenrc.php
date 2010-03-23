hardstatus alwayslastline "%{= rw} %H %{= wk}%-Lw%{= bw}%n%f* %t%{= wk}%+Lw %{= wk}%=%{= gk} %y/%m/%d %c "
bindkey "\033[11~" select 0
bindkey "\033[12~" select 1
bindkey "\033[13~" select 2
bindkey "\033[14~" select 3
bindkey "\033[15~" select 4
bindkey "\033[17~" select 5
bindkey "\033[18~" select 6
bindkey "\033[19~" select 7
bindkey "\033[20~" select 8
bindkey "\033[21~" focus
bindkey "\033[22~" title
bindkey "\033[23~" screen

caption always %w

screen -t vim
screen -t shell
select 0
!vim ./ 

