#!/bin/sh
# Rereate SlackBuilds repository in Git
#
# This scripts recreates SlackBuilds repository in Git, because proper
# migration is not possible due to its structure and the modifications of this
# structure done manually in CVS in the past. The different build scripts are
# organized as separate repositories and incorporated in this superproject as
# submodules.
#

CWD=$(pwd)
REPO_DIR=repo
REVN=0

# Bash colors
C_RED=$'\e[31;01m'
C_GREEN=$'\e[32;01m'
C_BLUE=$'\e[0;34m'
C_NORMAL=$'\e[0m'

ERRSTR="${C_RED}Error${C_NORMAL}"

# Print status functions
echo_done() {
  echo "${C_GREEN}done${C_NORMAL}."
}

echo_fail() {
  echo "${C_RED}fail${C_NORMAL}!"
}

echo_status() {
  if [ $? != 0 ]; then
    echo_fail
  else
    echo_done
  fi
}

function add_files {
  for file in $2; do
    cp ${CWD}/$file .
  done
  git add $2
  GIT_COMMITTER_DATE="$1" \
    git commit --no-gpg-sign --date "$1" -m "$3" $2
}

function add_submodule {
  git submodule add -b $3 $4 $2
  GIT_COMMITTER_DATE="$1" \
    git commit --no-gpg-sign --date "$1" -m "Add $2" .gitmodules $2
}

if [ -e $REPO_DIR ]; then
  echo "${ERRSTR}: Repository directory '$REPO_DIR' exists!"
  exit 1
fi

echo -n "Create repo directory... "
mkdir repo
echo_status
cd repo

echo -n "Initialize empty repository... "
git init >/dev/null
echo_status

while IFS=';' read -r rev_date rev_type rev_name rev_branch rev_message rev_repo; do
  # Skip header
  if [ "${rev_date}" == "Date" ]; then
    continue
  fi

  echo -n "Revision ${REVN} (from $rev_date): "

  case $rev_type in
    files)
      echo -n "adding file(s) ${rev_name}... "
      add_files "$rev_date" "$rev_name" "$rev_message" >/dev/null 2>&1
      echo_status
      ;;
    submodule)
      echo -n "adding submodule ${rev_name}... "
      add_submodule "$rev_date" "$rev_name" "$rev_branch" "$rev_repo" >/dev/null 2>&1
      echo_status
      ;;
    *)
      echo "${ERRSTR}: Unknown revision type '${rev_type}'!"
      exit 2
  esac

  REVN=$((REVN + 1))
done < ${CWD}/revisions.csv

