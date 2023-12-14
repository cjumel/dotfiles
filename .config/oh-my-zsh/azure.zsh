alias azl='az login'

alias azv='az vm'

alias azvd='az vm deallocate'
alias azvdr='az vm deallocate --resource-group'

# List IP addresses in a human-readable table
alias azvli='az vm list-ip-addresses --output table'
alias azvlir='az vm list-ip-addresses --output table --resource-group'

# List machines with their states
alias azvls='az vm list --show-details --query "[].{Name:name, Size:hardwareProfile.vmSize, State:powerState}" --output table'
alias azvlsr='az vm list --show-details --query "[].{Name:name, Size:hardwareProfile.vmSize, State:powerState}" --output table --resource-group'

alias azvs='az vm start'
alias azvsr='az vm start --resource-group'
