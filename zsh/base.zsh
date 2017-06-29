source ~/code/base/gems/grid/extras/shell-completion/grid_completion.zsh

# aliases
alias grid='RBENV_VERSION=2.3.4 grid'
alias dropship='RBENV_VERSION=2.3.4 dropship'

alias deploy='grid deploy'
alias dssh='dropship ssh'
alias teamcity='ssh -i ~/.ssh/infra.pem ubuntu@ec2-23-20-180-210.compute-1.amazonaws.com -L8111:localhost:8111 -N'
