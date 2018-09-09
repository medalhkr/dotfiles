set -gx ANYENV_ROOT /opt/anyenv/
source "/opt/anyenv/libexec/../completions/anyenv.fish"
function anyenv
  set command $argv[1]
  set -e argv[1]

  command anyenv "$command" $argv
end
set -x NODENV_ROOT "/opt/anyenv/envs/nodenv"
__add_userpath /opt/anyenv/envs/nodenv/bin
__add_userpath /opt/anyenv/envs/nodenv/shims
set -gx NODENV_SHELL fish
source '/opt/anyenv/envs/nodenv/libexec/../completions/nodenv.fish'
function nodenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (nodenv "sh-$command" $argv|psub)
  case '*'
    command nodenv "$command" $argv
  end
end
set -x PYENV_ROOT "/opt/anyenv/envs/pyenv"
__add_userpath /opt/anyenv/envs/pyenv/bin
__add_userpath /opt/anyenv/envs/pyenv/shims
set -gx PYENV_SHELL fish
source '/opt/anyenv/envs/pyenv/libexec/../completions/pyenv.fish'
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end
set -x RBENV_ROOT "/opt/anyenv/envs/rbenv"
__add_userpath /opt/anyenv/envs/rbenv/bin
__add_userpath /opt/anyenv/envs/rbenv/shims
set -gx RBENV_SHELL fish
source '/opt/anyenv/envs/rbenv/libexec/../completions/rbenv.fish'
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
end

# direnv

function __direnv_export_eval --on-event fish_prompt;
	eval ("/usr/local/bin/direnv" export fish);
end