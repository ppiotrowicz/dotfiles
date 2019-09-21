alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command
alias be="bundle exec"
alias test="bundle exec rspec spec"

# rails
alias migrate="bundle exec rake db:migrate"
alias rollback="bundle exec rake db:rollback"

# exa
alias ls=exa

alias shuttle-cli="RBENV_VERSION=2.4.2 shuttle-cli"

alias mixer='mix compile --force --warnings-as-errors; compile_out=$?; mix format; format_out=$?; mix credo; credo_out=$?; mix test; test_out=$?; echo "\033[0;32m\n\n    COMPILE -  FORMAT -  CREDO -  TEST\033[0m\n\n";'
