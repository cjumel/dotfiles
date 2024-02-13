alias azl='az login'

# For the `az vm` aliases, to specify one vm in particular, you can pass --name & --resource-group
# and their associated values
alias azv='az vm'

# To stop a VM without deleting it (meaning you don't pay for it but you can restart it later)
alias azvd='az vm deallocate'

# List IP addresses in a human-readable table
alias azvli='az vm list-ip-addresses --output table'

# List machines with their states
alias azvls='az vm list --show-details --query "[].{Name:name, Size:hardwareProfile.vmSize, State:powerState}" --output table'

# Start a VM
alias azvs='az vm start'
