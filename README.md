# linux-backup
Simple TimeMachine-like Backup Scripts for Linux. This is works for a mounted
volume.

# IMPORTANT NOTE:
This backup system assumes you are backing up to a file system that supports
hard links.

## Some Usage Notes
You must modify the `home_backup` and `full_backup` scripts to fit your specific
username, mountpoint, etc. Review the scripts to see what they do before trying
to run them.

The script prompts you with a dialog, whether or not to actually do the backup,
since it may not be a convenient time, depending on the performance of your 
system while it is backing up.

The script produces a log file in whatever directory you told it was `_HOME`.

In the `_DEST_ROOT` directory, a new directory will be created for each backup,
and the backup will be named with a timestamp. All files identical between
backups (from rsync's perspective) will be hard-linked, so there will actually
only be one copy on the disk and any can be deleted without affecting the
others. When the backup is completed a symlink called `latest` will point to
the backup directory just created.

## Running from cron
To run from cron, you can run the `home_backup` from a crontab-configured 
cron task by executing
```
sudo crontab -u <your-username> -e
```
Then paste the contents of `crontab_contents` into the editor _and modifying the
path to the_ `home_backup` _script_.

## full_backup
The prompt dialog is different (ugly) and will prompt you for your password, 
assuming you have sudo privileges.
If you want to run this from a user crontab, do as described above and modify 
the path.


## Thanks
Much thanks to [Michael Jakl](https://blog.interlinked.org/about/index.html)'s
"[Time Machine for every Unix out there](https://blog.interlinked.org/tutorials/rsync_time_machine.html)"
blog post, on which the `incremental_backup` script is based.
