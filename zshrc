  alias runxiflute='ssh root@134.209.56.193'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias grep='grep -n --exclude-dir=".git" --color=auto'
  alias ll="ls -lah"
  export CLICOLOR=1

  autoload -U colors && colors
  #supported colors:  red, blue, green, cyan, yellow, magenta, black, & white
  #
  # Load version control information
  autoload -Uz vcs_info
  precmd() { vcs_info }

  # Format the vcs_info_msg_0_ variable
  zstyle ':vcs_info:git:*' formats '(%b)'

  # Set up the prompt (with git branch name)
  setopt PROMPT_SUBST
  PROMPT='%n in %{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%} %{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%} $ '
