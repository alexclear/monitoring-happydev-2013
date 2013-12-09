#!/bin/bash
(
cat <<'EOF'
mine_functions:
  network.interfaces: []
EOF
) >> /etc/salt/minion
service salt-minion restart
