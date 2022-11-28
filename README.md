
![logo2](https://user-images.githubusercontent.com/31628014/144424190-ec7b0b40-49f0-41be-b3c6-fc2f3bfb82ff.png)

# trn.SCRW / СКУРС
_Панель администратора_

_**СКУРС** — Система контроля удаленных рабочих станций_ 

_**SCRW** — System of Control Remote Workstations_

## Основное 
### Язык программирования и требования

- **Delphi/Object Pascal** *(RAD Studio 11)*
- Windows Workstations x64 ONLY

### БД

- **mySQL 5**

### Вид приложения

Клиент-серверное приложение распределенного типа:

- Консоль управления Администратора ИС
- Сервер приложения
- Агент контроля на АРМ подконтрольного пользователя

### Скриншоты

Скриншот окна аутентификации
![Auth](https://github.com/Ternogon/SCRW/blob/main/pic/2022-11-28_14-55-44.png)

Скриншот основного окна оснастки администрирования
![Main](https://github.com/Ternogon/SCRW/blob/main/pic/2022-11-28_14-56-19.png)

Скриншот вкладки общих ограничений для установленной политики
![Main-P](https://github.com/Ternogon/SCRW/blob/main/pic/2022-11-28_14-56-34.png)

Скриншот вкладки общего журнала событий
![Main-L](https://github.com/Ternogon/SCRW/blob/main/pic/2022-11-28_14-57-03.png)

Скриншоты вкладки управления пользователями
![Main-U1](https://github.com/Ternogon/SCRW/blob/main/pic/2022-11-28_14-57-17.png)
![Main-U6](https://github.com/Ternogon/SCRW/blob/main/pic/2022-11-28_14-57-37.png)

## 

Так как все данные для подключения к БД вшиты в проект, доступ к БД теперь осуществляется по вайтлисту.
Собирать только под x64.
