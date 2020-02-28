# Backup to Git

A very simple script meant to backup files into Git.

Mostly intended to backup my workspace configurations and other text-based stuff.

## Usage

Simply edit the `backup.txt` file and add entries in the following format:

```
category:/path/to/my/file
category:/path/to/my/directory

```

You must leave the last line empty.

After doing so, alter the `run.sh` script and update `remote_git` to whatever your Git repo URL is.

Running it should be as simple as running `./run.sh`

The script will clone from this source, clean up any existing files, add the new ones (inside their respective category directories) and finally commit them back.

You can also use `crontab` to run the backups. Since the script uses Git, only the files that actually changed will be commited.

## Author

This script was developed by [Matheus Pratta](https://matheus.io) and is released free of charge, under the MIT license.