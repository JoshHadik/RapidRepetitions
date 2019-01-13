source .aws/access/env.sh

# If you source .access/connect in terminal, easily connect with an eb environment by calling '$ connect_with_env prod'
function connect_with_env() {
  local env=$1

  if [ "$env" = 'prod' ]; then
    ssh -i .aws/access/ProdSSH.pem.txt ec2-user@$PROD_IP
  fi

  if [ "$env" = 'stag' ]; then
    ssh -i .aws/access/StagSSH.pem.txt ec2-user@$STAG_IP
  fi
}

# Alternatively, you can connect by calling bash on this file '$ bash .access/connect.sh prod'
if [[ -n "$1" ]]; then
  connect_with_env $1
fi

# Aliases (useful if you source this file)
alias "connect_with_prod"="connect_with_env prod"
alias "cwp"="connect_with_env prod"
alias "connect_with_stag"="connect_with_env stag"
alias "cws"="connect_with_env stag"
