source ~/.externals/antigen/antigen.zsh

# load oh-my-zsh
antigen use oh-my-zsh

# use some oh-my-zsh bundles

# SCM
antigen bundle git
antigen bundle mercurial
antigen bundle svn

# Python
antigen bundle pep8
antigen bundle pip
antigen bundle pyenv
antigen bundle pylint
antigen bundle python

# Shell management
antigen bundle autojump
antigen bundle tmux

# package management
antigen bundle brew
antigen bundle dirhistory

# database
antigen bundle postgres
antigen bundle redis-cli

# Syntax highlighting and auto completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# Per directory environments
antigen bundle kennethreitz/autoenv

antigen theme jreese

# antigen go
antigen apply

# extra completions
fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)

source ~/.zstyle
source ~/.zalias
source ~/.zfunction
