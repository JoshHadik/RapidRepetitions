TRAVIS_BRANCH=$TRAVIS_BRANCH
TRAVIS_PULL_REQUEST=$TRAVIS_PULL_REQUEST

# True if TRAVIS_BRANCH is equal to first argument otherwise false
current_branch_is?() {
  local branch_name=$1
  return $([ "$TRAVIS_BRANCH" = "$branch_name" ] && true || false)
}

# True if TRAVIS_PULL_REQUEST is false otherwise true
is_not_pull_request?() {
  return $([ "$TRAVIS_PULL_REQUEST" = false ] && true || false)
}

# True if TRAVIS_BRANCH is either master or devmaster otherwise false
request_branch_is_deployable?() {
  if current_branch_is? master || current_branch_is? development; then
    true
  else
    false
  fi
}

# Alias of current_branch_is?
travis_helper::current_branch_is?() {
  current_branch_is? $1
}

# True if current travis run will deploy (assuming no errors) otherwise false
travis_helper::request_will_deploy?() {
  if is_not_pull_request? && request_branch_is_deployable?; then
    true
  else
    false
  fi
}
