for FILE in ~/.zsh/functions/* ; do source $FILE ; done

for FILE in ~/.zsh/aliases/* ; do source $FILE ; done

[ -f ~/.pdot/zshenv ] && source ~/.pdot/zshenv
