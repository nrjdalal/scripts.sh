#!/bin/bash

version="0.0.10"

# sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/HEAD/zrn.sh)"

# ------------------------------ functions ------------------------------

checkLatest() {

  latest_version="$(curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/HEAD/zrn.sh | sed -n '3p' | sed 's/version="//' | sed 's/"//')"

}

rootCheck() {

  if [[ $(id -u) -ne 0 ]]; then
    echo "error: given command must be run using $(tput setaf 3)sudo$(tput sgr0)"
    exit 1
  fi

}

addZrn() {

  checkLatest
  curl -fsSL https://raw.githubusercontent.com/nrjdalal/zrn/HEAD/zrn.sh >$ZRN
  chmod +x $ZRN

  echo "success: $(tput setaf 2)added zrn $latest_version$(tput sgr0)"
  exit 0

}

# ------------------------------ auto-install ------------------------------

case $(uname) in

Darwin) ZRN=/usr/local/bin/zrn ;;
Linux) ZRN=/usr/bin/zrn ;;
*)

  echo "os not supported yet! tune in later!"
  exit 0
  ;;

esac

if [[ ! -x "$ZRN" ]]; then

  rootCheck
  addZrn

fi

case $1 in

# ------------------------------ version ------------------------------

-v | -version | --version)

  checkLatest

  if [[ "$version" == "$latest_version" ]]; then
    echo "you're using the latest verion $version"
  else
    echo "newer version available $version -> $(tput setaf 2)$latest_version$(tput sgr0)"
    echo "run $(tput setaf 3)sudo zrn update$(tput sgr0) to upgrade"
  fi

  ;;

# ------------------------------ 03) update ------------------------------

update | upgrade)

  rootCheck
  addZrn

  ;;

# ------------------------------ homebrew ------------------------------

brew | homebrew)

  case $2 in

  install)

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    ;;

  *)

    if brew --version >/dev/null 2>/dev/null; then
      brew --verion
    else
      echo "error: homebrew not found"
      echo "run $(tput setaf 3)zrn brew install$(tput sgr0) to install"
    fi

    ;;

  esac

  ;;

# ------------------------------ github-cli ------------------------------

gh | github)

  gh --version >/dev/null 2>/dev/null
  CHECK=$?
  if [[ $CHECK -ne 0 ]]; then
    echo "ghcli not found"
  fi

  ;;

# ------------------------------ SELF HELP ------------------------------

*)

  echo
  echo "be careful what you wish for!"
  echo

  ;;

esac
