set PATH /usr/local/anaconda/bin "$HOME"/anaconda/bin "$HOME"/anaconda/lib "$HOME"/anaconda/include/python2.7/ "$HOME"/bin /usr/local/bin /usr/local/share/npm/bin /opt/local/bin /opt/local/sbin $PATH
set -x PYTHONPATH $HOME/Code/: $HOME/Code/luigi/: $PYTHONPATH
set CDPATH . "$HOME" $CDPATH
set -x LUIGIPATH "$HOME"/Code/pymouse/client.cfg

set fish_greeting ""
 
function fish_user_key_bindings
    bind \e\[1\;9A 'history-token-search-backward'
end
 
alias v=vim
alias gb='git branch'
alias gco='git checkout'
alias gca='git commit --all'
alias gs='git status'
alias gl='git lg'
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias less='less -r'
 
# see https://github.com/fish-shell/fish-shell/issues/393
function make_completion --argument alias command
    complete -c $alias -xa "(
    set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
    complete -C\"$command \$cmd\";
    )"
end
make_completion gb 'git branch'
make_completion gco 'git checkout'
make_completion gca 'git commit --all'
make_completion pcat 'cat'
 
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

. functions/z.fish
