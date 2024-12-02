#!/bin/bash
set -e

# Executa o script install.sh
bash /app/install.sh -y

# Mantém o container ativo
exec tail -f /dev/null
