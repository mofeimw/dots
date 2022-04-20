# prompt
TYPEWRITTEN_DISABLE_RETURN_CODE="true"
TYPEWRITTEN_SYMBOL="$"

fpath+=$HOME/.zsh/typewritten
autoload -U promptinit; promptinit
prompt typewritten

# config
source ~/z.sh

export EDITOR=vim
export VISUAL=vim

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# padding for ocd
precmd() {
    eval "precmd() { echo }"
}

# dev time savers
run() {
    name=${PWD##*/}
    [ -f main.sh ] && { ./main.sh "$@"; return 0 }
    [ -f main ] && { ./main "$@"; return 0 }
    [ -f "$name" ] && ./$name "$@"
}

edit() {
    name=${PWD##*/}
    [ -f main.sh ] && { vim main.sh; return 0 }
    [ -f "$name" ] && vim "$name" || {
        for file in main*; {
            vim "$file"
            break
        }
    }
}

# ship 'em off
:w() {
    name=${PWD##*/}
    [ -x main.sh ] && cp main.sh ~/circus/$name || [ -x main ] && cp main ~/circus/$name || [ -x ${name}.sh ] && cp ${name}.sh ~/circus/$name || [ -x ${name} ] && cp ${name} ~/circus/$name
}

# color theme
colors() {
    clear
    for i in {0..7}; do
        printf '\033[4'$i'm    '
    done
    echo
}

# invisible cat!
transparent() {
    conf='/Users/mofei/.config/kitty/transparent.conf'
    [ -s "$conf" ] && : > $conf || {
        echo "background_opacity 0" > $conf
        echo "window_margin_width 0" >> $conf
        echo "window_padding_width 0" >> $conf
    }
}

# aliases
alias :q="exit"
alias notes="vim ~/.notes"
alias dots="/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME"

alias guitar="open /Users/mofei/music/guitar; exit"
alias tv="open /Users/mofei/.ogygia/tv; exit"
alias mans="open /Users/mofei/documents/man; exit"

alias t="translate $(pbpaste)"
alias ts="translate -speak $(pbpaste) &> /dev/null"

alias email="echo mwang02@bluevalleyk12.net | pbcopy; exit"

# path
export PATH="/usr/local/bin:$PATH:/Users/mofei/circus"
