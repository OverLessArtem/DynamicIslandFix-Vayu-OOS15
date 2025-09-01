#!/system/bin/sh
MODDIR=${0%/*}
CONFIG_DIR=/storage/emulated/0/DynamicIsland
CONFIG_FILE=$CONFIG_DIR/packages.config

mkdir -p $CONFIG_DIR
if [ ! -f $CONFIG_FILE ]; then
  echo "Добавь package names через запятую, без пробелов: org.telegram.messenger,com.spotify.music" > $CONFIG_FILE
  echo "Пример: для Telegram и Spotify" >> $CONFIG_FILE
fi
chmod 644 $CONFIG_FILE
