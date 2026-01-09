#!/usr/bin/env sh
set -eu

service_name="tapdrop.service"
service_path="/etc/systemd/system/${service_name}"
repo_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

if [ "$(id -u)" -ne 0 ]; then
  echo "error: run as root (sudo) to write ${service_path}" >&2
  exit 1
fi

ln -sf "${repo_dir}/${service_name}" "${service_path}"
systemctl daemon-reload
systemctl enable "${service_name}"
systemctl restart "${service_name}"
echo "linked ${service_name} to ${service_path}"
