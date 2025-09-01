#!/system/bin/sh

CONFIG_DIR=/storage/emulated/0/DynamicIsland

if [ -d "$CONFIG_DIR" ]; then
  rm -rf "$CONFIG_DIR"
  echo "Папка DynamicIsland удалена при деинсталле модуля."
fi
