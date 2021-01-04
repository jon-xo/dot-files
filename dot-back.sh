#!/bin/sh

# change directory to home folder
cd ~

# list file names and run grep search which includes "bash, fzf, zsh" and excludes filenames with "history, swp, pre". Copy grep results to working directory.
ls -1a | grep -i 'bash\|fzf\|zsh' | grep -v 'history\|swp\|pre' | xargs -I '{}' cp -Rf '{}' ~/bin/dot-files/

# Create conjob
## $ crontab -e
# Execute cron job every 15 minutes
## */15 * * * * ~/bin/dot-files/dot-back.sh > /tmp/stdout.log 2>/tmp/stderr.log
