#!/bin/sh

## v1.0 -- Tested as working in Ubuntu 20.04, ...macOS test pending...

# Path variables
PROJROOT=$(find $HOME -maxdepth 3 -path "$HOME/Library" -prune -o  -path "$HOME/.Trash" -prune -o -type d -name "dot-files" -print)
USR=$USER
_dir="${1:-${PWD}}"

# Envoke detectOS script to identify current OS
# and store result in ostype
source $PROJROOT/cmds/detectOS.sh ostype

# Check for cron-setup first run file, 
# if file is present, checck for setup string
# and exit

if  [ -f "$PROJROOT/cron/.CronSetupDone" ] && grep -q "$USR-cron-setup" "$PROJROOT/cron/.CronSetupDone";
then
  return 0
else
    # If setup file is not present, create temporary file with crontab syntax in /tmp directory
    $(touch /tmp/tempJob && chmod 600 /tmp/tempJob) && echo "*/20 * * * * $PROJROOT/dot-back.sh > /tmp/stdout.log 2>/tmp/stderr.log" >> /tmp/tempJob
    # Add new job to cron tab using temp file 
    if [[ "$ostype" == "linux" ]];
    then
      crontab -u $USR /tmp/tempJob
    else
      crontab /tmp/tempJob
    fi
    # Create setup file in project cron directory
    touch $PROJROOT/cron/.CronSetupDone && echo "$USR-cron-setup" >> $PROJROOT/cron/.CronSetupDone
    # remove temporary file
    rm -rf /tmp/tempJob
fi