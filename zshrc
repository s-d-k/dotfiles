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
antigen bundle tmuxinator

# package management
antigen bundle brew
antigen bundle dirhistory

# database
antigen bundle postgres
antigen bundle redis-cli

# Syntax highlighting and auto completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen theme jreese

# antigen go
antigen apply

# extra completions
fpath=(~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-completions.git/src $fpath)

# gem path
path=(/usr/local/opt/ruby/bin $path)

# include smartcd
source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-cxreg-SLASH-smartcd.git/lib/core/smartcd
source ~/.smartcd_config

source ~/.zstyle
source ~/.zalias
source ~/.zfunction
