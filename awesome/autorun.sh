function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run compton --config $HOME/.config/compton.conf
