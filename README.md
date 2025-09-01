# DynamicIslandFix-Vayu-OOS15

Модуль Magisk/KSU для Poco X3 Pro (vayu) на OxygenOS 15. Автоматически включает Dynamic Island для любых приложений.

## Что делает
- Добавляет указанные приложения в конфиг Dynamic Island (oplus_media_controller_config_sp.xml).
- Создает резервную копию оригинального конфига.

## Как установить
1. Скачайте ZIP-модуль из Releases.
2. Установите через Magisk/KSU (Модули -> Установить из хранилища).
3. Перезагрузите устройство.

## Как использовать модуль
1. Запустите "живую активность" (Live Activity) в музыкальном приложении (например, HeyTap Music), чтобы создался файл конфига.
2. Откройте /storage/emulated/0/DynamicIsland/packages.config в текстовом редакторе.
3. Добавьте названия пакетов приложений через запятую (без пробелов), например: org.telegram.messenger,com.spotify.music,com.vk.mp3.
4. Перезагрузите устройство.

## Ручной способ (без модуля)
Если вы хотите настроить Dynamic Island без модуля, следуйте этим шагам (основано на решении от @artofgoodman https://4pda.to/forum/index.php?showuser=3657485)

1. Откройте файловый менеджер с root-правами (рекомендуется MiX Explorer или MT Manager).
2. Перейдите в папку: /data/user_de/0/com.android.systemui/shared_prefs.
3. Найдите файл oplus_media_controller_config_sp.xml.
4. Сделайте резервную копию этого файла (например, скопируйте в /storage/emulated/0).
5. Откройте oplus_media_controller_config_sp.xml в текстовом редакторе. Пример содержимого:
```xml
<?xml version='1.0' encoding='utf-8' standalone='yes' ?>
<map>
<int name="rus_location_version_key" value="20241112" />
<set name="rus_content_key">
<string>[com.tencent.qqmusic,com.netease.cloudmusic,com.heytap.music]</string>
</set>
</map>
```
6. Найдите строку `<string>[список_пакетов]</string>`. Список пакетов разделен запятыми.
7. В конец списка, перед закрывающей скобкой `]`, добавьте через запятую название пакета приложения (например, org.telegram.messenger для Telegram). Пример:
```xml
<string>[com.tencent.qqmusic,com.netease.cloudmusic,com.heytap.music,org.telegram.messenger]</string>
```
8. Сохраните файл.
9. Перезагрузите устройство.

## Примечания
- Для работы нужен root (Magisk/KSU/KSU Next).
- Если файл oplus_media_controller_config_sp.xml отсутствует, убедитесь, что запустили Live Activity.
- Для поиска названий пакетов приложений используйте приложение вроде Package Name Viewer.
- Храните резервную копию конфига на случай ошибок.

## Кредиты
Основано на решении от @artofgoodman (https://4pda.to/forum/index.php?showuser=3657485) с 4PDA.

## Лицензия
[![Лицензия: GPL-3.0](https://img.shields.io/badge/Лицензия-GPL--3.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
