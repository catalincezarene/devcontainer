#!/bin/bash
set -Eeuo pipefail
user=${SSH_USER:-dev}
password=${SSH_PASSWORD:-password}
uid=${SSH_UID:-1000}
gid=${SSH_GID:-1000}
groupadd -g $gid $user
useradd -u $uid -g $gid -s /bin/bash -m $user
echo "${user}:${password}" | chpasswd
chown -R $uid:$gid "/home/${user}"
exec "$@"
