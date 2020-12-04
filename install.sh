#!/bin/bash
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly CONFIG_DIR="${SCRIPT_DIR}/config"
readonly CONFIG_LIST=("tmux.conf" "vimrc" "zshrc")
readonly TARGET_DIR="$HOME"
readonly BACKUP_DIR="${SCRIPT_DIR}/backup"

# backup
echo "take backup..."
rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR

for elem in ${CONFIG_LIST[@]}
do
    if test -f "$TARGET_DIR/.$elem"
    then
        cp "$TARGET_DIR/.$elem" "$BACKUP_DIR/$elem"
    fi
done

# install
echo "install config..."
for elem in ${CONFIG_LIST[@]}
do
    cp "$CONFIG_DIR/$elem" "$TARGET_DIR/.$elem"
done

echo "done :)"
