#login prompt
echo ""
echo -n "User: "; whoami
echo ""
echo -n "Hostname: "; Hostname
echo ""
echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
echo ""
echo -n "Uptime: "; uptime
echo ""

# abbreviations for command shorcuts
alias ll='ls -lah'
alias home='cd ~'
alias flushDNS='dscacheutil -flushcache'            # flushDNS: Flush out the DNS Cache

#primary user prompt name
MYNAME='jonn'
export MYNAME
export PS1="\W:\u$ >: "

# If id command returns zero, you’ve root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red color prompt
  PS1="\\[$(echo -e "\\033[38;5;124m)\\]\\W:\\u$ >: \\\\033[0m\\")]"
else # normal
  PS1="\\[$(echo -e "\\033[38;5;039m)\\]\\W:\\u$ >: \\\\033[0m\\")]"
fi



## Color Codes for setaf when using tput.
# 0 – Black
# 1 – Red
# 2 – Green
# 3 – Yellow
# 4 – Blue
# 5 – Magenta
# 6 – Cyan
# 7 – White
##

if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi 

export LESS='-M'
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export EDITOR='subl -w'				# default editor for commenting git commits

export HISTSIZE=10000				# 500 is default
export HISTTIMEFORMAT='%b %d %I:%M %p '		# using strftime format
export HISTCONTROL=ignoreboth			# ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:ll"

#returns grep matches as color coded.
export GREP_COLOR="1;37;41"
alias grep='grep --color=auto'

#Enable Powerline for Bash shell
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh

# egrep --color=auto -i '(error|fatal|warn|drop)' /var/log/messages/

# Specify the options grep should use by default
# export GREP_OPTIONS="--color=auto"

# GREP_COLOR codes
# Attributes:   Text color:    Background:
#   0 reset all   30 black       40 black
#   1 bright      31 red         41 red
#   2 dim         32 green       42 green
#   4 underscore  33 yellow      43 yellow
#   5 blink       34 blue        44 blue
#   7 reverse     35 purple      45 purple
#   8 hidden      36 cyan        46 cyan
#                 37 white       47 white
# Separate with ";"

#PRO-TIP: To reload type $ source .bashrc
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
