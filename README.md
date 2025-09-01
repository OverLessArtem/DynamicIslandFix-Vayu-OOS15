# DynamicIslandFix-Vayu-OOS15

Модуль Magisk/KSU для Poco X3 Pro (vayu) на OxygenOS 15. Автоматически включает Dynamic Island для любых приложений

## Что делает
- Добавляет указанные приложения в конфиг Dynamic Island (oplus_media_controller_config_sp.xml).
- Создает резервную копию оригинального конфига.

## Как установить
1. Скачай ZIP-модуль из Releases.
2. Установи через Magisk/KSU (Модули -> Установить из хранилища).
3. Перезагрузи устройство.

## Как использовать модуль
1. Запусти "живую активность" (Live Activity) в музыкальном приложении (например, HeyTap Music), чтобы создался файл конфига.
2. Открой /storage/emulated/0/DynamicIsland/packages.config в текстовом редакторе.
3. Добавь названия пакетов приложений через запятую (без пробелов), например: org.telegram.messenger,com.spotify.music,com.vk.mp3.
4. Перезагрузи устройство.

## Ручной способ (без модуля)
Если хочешь настроить Dynamic Island без модуля, следуй этим шагам (основано на решении от @artofgoodman https://4pda.to/forum/index.php?showuser=3657485):

1. Открой файловый менеджер с root-правами (рекомендуется MiX Explorer или MT Manager).
2. Перейди в папку: /data/user_de/0/com.android.systemui/shared_prefs.
3. Найди файл oplus_media_controller_config_sp.xml.
4. Сделай резервную копию этого файла (например, скопируй в /storage/emulated/0).
5. Открой oplus_media_controller_config_sp.xml в текстовом редакторе. Пример содержимого:
```xml
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
<int name="rus_location_version_key" value="20241112" />
<set name="rus_content_key">
<string>[com.tencent.qqmusic,com.netease.cloudmusic,com.heytap.music]</string>
</set>
</map>
```
6. Найди строку `<string>[список_пакетов]</string>`. Список пакетов разделен запятыми.
7. В конец списка, перед закрывающей скобкой `]`, добавь через запятую название пакета приложения (например, org.telegram.messenger для Telegram). Пример:
```xml
<string>[com.tencent.qqmusic,com.netease.cloudmusic,com.heytap.music,org.telegram.messenger]</string>
```
8. Сохрани файл.
9. Перезагрузи устройство.

## Примечания
- Для работы нужен root (Magisk/KSU/KSU Next).
- Если файл oplus_media_controller_config_sp.xml отсутствует, убедись, что запустил Live Activity.
- Для поиска названий пакетов приложений используй приложение вроде Package Name Viewer.
- Храни резервную копию конфига на случай ошибок.

## Кредиты
Основано на решении от @artofgoodman (https://4pda.to/forum/index.php?showuser=3657485) с 4PDA.
