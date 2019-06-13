#!/bin/bash
[[ $UID == 0 ]] || { echo "run as sudo to install"; exit 1; }

if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  apt install jq -y
fi

REPO="https://github.com/BurntSushi/ripgrep/releases/download/"
RG_LATEST=$(curl -sSL "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | jq --raw-output .tag_name)
RELEASE="${RG_LATEST}/ripgrep-${RG_LATEST}-x86_64-unknown-linux-musl.tar.gz"

TMPDIR=$(mktemp -d)
cd $TMPDIR
wget -O - ${REPO}${RELEASE} | tar zxf - --strip-component=1
mv rg /usr/local/bin/
mkdir -p /usr/local/share/man/man1
mv rg.1 /usr/local/share/man/man1/
mv complete/rg.bash-completion /usr/share/bash-completion/completions/rg
mandb
