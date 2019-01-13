source .access/env.sh

# NOTICE -> all sourcing and calls to this file assume to be made from root directory using full path to file (.access/connect.sh). Attempting to source files or run bash from inside the .access folder may result in errors.

# If you source .access/connect in terminal, easily ssh into an eb environment by calling '$ connect_with_env prod'
function connect_with_env() {
  local env=$1

  if [ "$env" = 'prod' ]; then
    ssh -i .access/keys/ProdSSH.pem.txt ec2-user@$PROD_IP
  fi

  if [ "$env" = 'dev' ]; then
    ssh -i .access/keys/DevSSH.pem.txt ec2-user@$DEV_IP
  fi
}

# Alternatively, you can connect by calling bash on this file '$ bash .access/connect.sh prod'
if [[ -n "$1" ]]; then
  connect_with_env $1
fi

# Aliases (useful if you source this file)
alias "connect_with_prod"="connect_with_env prod"
alias "cwp"="connect_with_env prod"
alias "connect_with_dev"="connect_with_env dev"
alias "cwd"="connect_with_env dev"
