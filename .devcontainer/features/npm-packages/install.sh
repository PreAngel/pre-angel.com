#!/usr/bin/env bash
set -e

# Match Node feature's USERNAME initialization
USERNAME="${USERNAME:-"${_REMOTE_USER:-"automatic"}"}"

# Require root, like official features
if [ "$(id -u)" -ne 0 ]; then
  echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
  exit 1
fi

echo "🔧 Feature 'npm-packages': starting"
echo "PACKAGES raw value: '${PACKAGES}'"

if [ -z "${PACKAGES}" ]; then
  echo "🔧 Feature 'npm-packages': PACKAGES is empty, nothing to install. Done."
  exit 0
fi

# ---- Username resolution: copy from Node feature ----
if [ "${USERNAME}" = "auto" ] || [ "${USERNAME}" = "automatic" ]; then
  USERNAME=""
  POSSIBLE_USERS=("vscode" "node" "codespace" "$(awk -v val=1000 -F ":" '$3==val{print $1}' /etc/passwd)")
  for CURRENT_USER in "${POSSIBLE_USERS[@]}"; do
    if id -u ${CURRENT_USER} > /dev/null 2>&1; then
      USERNAME=${CURRENT_USER}
      break
    fi
  done
  if [ "${USERNAME}" = "" ]; then
    USERNAME=root
  fi
elif [ "${USERNAME}" = "none" ] || ! id -u ${USERNAME} > /dev/null 2>&1; then
  USERNAME=root
fi

echo "🔧 Feature 'npm-packages': using USERNAME='${USERNAME}'"

# ---- Normalize PACKAGES into a space-separated list ----
# Handles:
#   "tsx firebase-tools"
#   "tsx,firebase-tools"
#   '["tsx","firebase-tools"]'
NORMALIZED="$(printf '%s\n' "${PACKAGES}" \
  | sed -e 's/\[//g' -e 's/\]//g' -e 's/\"//g' \
  | tr ',' ' ' \
  | tr -s '[:space:]' ' ')"

# Trim leading/trailing spaces
NORMALIZED="$(echo "${NORMALIZED}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

if [ -z "${NORMALIZED}" ]; then
  echo "🔧 Feature 'npm-packages': After normalization, package list is empty. Nothing to do."
  exit 0
fi

echo "🔧 Feature 'npm-packages': Installing packages: ${NORMALIZED}"

# NVM_DIR is set by the Node feature; default to the same path if missing
NVM_DIR="${NVM_DIR:-"/usr/local/share/nvm"}"

# Install globally as the same user Node uses.
# We try to use the default Node version via nvm, but fall back to raw npm if needed.
set -f  # disable globbing
su "${USERNAME}" -c "
  set -e
  umask 0002
  if [ -s '${NVM_DIR}/nvm.sh' ]; then
    . '${NVM_DIR}/nvm.sh'
    if type nvm >/dev/null 2>&1; then
      nvm use default >/dev/null 2>&1 || true
    fi
  fi
  npm install -g ${NORMALIZED}
"
set +f

echo "✅ Feature 'npm-packages': Finished installing global npm packages."
