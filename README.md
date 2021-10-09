# ISSO Telegram Notifier 🔔

Get notification on Telegram if someone create, edit or delete comment on your isso comment system.

## 💡 How does it work?

Using `tail` and `grep` to watch the log file and Match the Current log Keyword. Once it matches, you will Get notfication alert on Telegram.

## 🔧 ISSO Configuration 

**:warning: Note** - Don't Setup SMPT Email Notification if you are going to use this Notification Method - Use `stdout` - <https://posativ.org/isso/docs/configuration/server/#general>

**📕 Example Conf for Log**:

```bash
[general]
dbpath = /home/isso/issocomments.db
host =
    http://example.com/
    https://example.com/
max-age = 15m
notify = stdout
log-file = /home/isso/issocomments.log
```
## Notification Script Setup
- Download the [notify.sh file](https://github.com/mskian/isso-telegram-notifier/blob/main/notify.sh) on your linux server in `root` or `home` (Home Recommended)
- Open the file and add these values (Required) (Get Chat ID from here - <https://t.me/@chatidx_bot>)
```
API= Telegram Bot API Key
CHATID= Telegram Chat ID
MESSAGE= "New Comment Action on example.com"
LOGFILE= Path of the isso log
```
- Now, Make it executable `chmod +x notify.sh`
- Next Setup `systemd` for Running this script continuously 

```bash

cd /etc/systemd/system

# Create New Serivice File
touch issonotify.service

# Create a Service file for systemd service
nano issonotify.service

```

- Now paste everything from <https://github.com/mskian/isso-telegram-notifier/blob/main/issonotify.service> and save it.

- Reload the systemd and enable the issonotify service

```bash
systemctl daemon-reload
systemctl enable issonotify
systemctl start issonotify
```

- You can Check the service status with

```bash
systemctl status issonotify
```

## LICENSE ☑

MIT
