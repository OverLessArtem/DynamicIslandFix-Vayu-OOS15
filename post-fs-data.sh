#!/system/bin/sh

XML_PATH=/data/user_de/0/com.android.systemui/shared_prefs/oplus_media_controller_config_sp.xml
CONFIG_FILE=/storage/emulated/0/DynamicIsland/packages.config
BACKUP_PATH=$XML_PATH.bak

if [ ! -f "$XML_PATH" ]; then
  echo "XML файл не найден. Запусти Live Activity в музыке сначала!" >&2
  exit 0
fi

cp "$XML_PATH" "$BACKUP_PATH"

PACKAGES=$(grep -v '^#' "$CONFIG_FILE" | tr -d ' ' | tr ',' ' ')

[ -z "$PACKAGES" ] && exit 0

CURRENT_LIST=$(sed -n 's/.*<string>\[\(.*\)\]<\/string>.*/\1/p' "$XML_PATH" | tr -d ' ')

NEW_LIST="$CURRENT_LIST"
for pkg in $PACKAGES; do
  if ! echo "$CURRENT_LIST" | grep -q "$pkg"; then
    if [ -n "$NEW_LIST" ]; then
      NEW_LIST="$NEW_LIST,$pkg"
    else
      NEW_LIST="$pkg"
    fi
  fi
done

if [ "$CURRENT_LIST" != "$NEW_LIST" ]; then
  sed -i "s|<string>\[.*\]</string>|<string>[$NEW_LIST]</string>|" "$XML_PATH"
  echo "Добавлены пакеты: $PACKAGES. Перезагрузи для теста!"
else
  echo "Пакеты уже добавлены"
fi
