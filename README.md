# ISSO Telegram Notifier 🔔

Get ISSO New Comment | Edit Comment | Delete Comment Notifications on Telegram.

## How does it Works?

using `tail` and `grep` to watch the log and Match the Current log Keyword once it Matched you will Get notfication alert on Telegram

## Setup

**Note** - Don't Setup SMPT Email Notification if you are going to use this Notification Method - Use `stdout` - <https://posativ.org/isso/docs/configuration/server/#general>

**EXample Conf for Log**:

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

- Download the bash file on your linux server `root` location or `home`
- Add your Bot Token, Chat id, Log file location, Telegram Message in the Bash file
- Setup Permission `chmod +x notify.sh`
- Next Setup `systemd` for Running this script continuously

```bash

cd /etc/systemd/system

# Create New Serivice File
touch issonotify.service

# Add the Servie file conf for isso Comments log Notification
nano issonotify.service

```

- After all setup Start the service

```bash
systemctl daemon-reload
systemctl enable issonotify
systemctl start issonotify
```

- Check Status

```bash
systemctl status issonotify
```

## LICENSE

MIT
