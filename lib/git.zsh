function git_branch() {
  # If we are on a folder not tracked by git, get out.
  # Otherwise, check for hide-info at global and local repository level
  if ! command git rev-parse --git-dir &> /dev/null; then
    return 0
  fi

  local ref
  ref=$(command git symbolic-ref --short HEAD 2> /dev/null) \
  || ref=$(command git rev-parse --short HEAD 2> /dev/null) \
  || return 0

  echo "${ref}"
}
