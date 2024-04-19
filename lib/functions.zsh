# SSH with Kitty
function sshk() {
  kitty +kitten ssh $@
}

# Like whoami, but what is this computer.
function whatisthis() {
  uname -a
  lsb_release -a
}

# Make directory and cd into it
function mdir() {
  mkdir -p $@ && cd ${@:$#}
}

# Show disk space (using du).
function disk() {
  du -h . -a -d 1 | sort -h
}

# Search for text in files.
function search() {
  grep -RE "^.*$1.*" . --color=always
}

# Move file or directory to trash directory.
function trash() {
  if [ -z $TRASH_DIR ]; then
  	mkdir -p $HOME/trash
	mv $1 $HOME/trash
  else
  	mv $1 $TRASH_DIR
  fi
}

# netcat
function netc() {
  if [ $1 = "-l"]; then
    nc -l -p 7555 > $2
  elif [ $1 = "-s"]; then
    nc $2 7555 < $3
  fi
}


# Scan for devices on local network with nmap.
function sclan() {
  nmap -sP 192.168.1.1/24
}

# cd .. (...)
function cd() {
  if [ "$#" -eq 0 ]; then
    builtin cd
  elif [ "$(printf '%s' "$1" | wc -l)" -eq 0 ]; then
    builtin cd "$(printf '%s' "$1" | sed '/^\.\.*$/ {s|..|.|; s|.|../|g; }')"
  else
    builtin cd "$1"
  fi
}

# Docker
function dock() {
  if [ $# -eq 0 ]; then
    docker ps
  elif [ $1 = "latest" ]; then
    docker exec -it $(docker ps -lq) /bin/bash
  else
    docker exec -it $1 /bin/bash
  fi
}

# Virtual environments
function activate() {
  if [[ -z "$1" ]]; then
    # No argument specified, default to .venv in cwd or error.
    if [[ -d .venv ]]; then
	  source .venv/bin/activate
	else
	  echo "error: no venv name provided, and no .venv found in current directory."
    fi
  else
  	source $VENV_PATH/$1/bin/activate
  fi
}

function venv() {
  ${PYVERSION:-python3} -m venv $VENV_PATH/$1
  echo "$1 created (${PYVERSION:-python3})"
  ln -s $VENV_PATH/$1 .venv
  activate $1
}

function password() {
  if [[ -z "$1" ]]; then
    openssl rand -base64 12
  else 
    openssl rand -base64 $1
  fi
}




