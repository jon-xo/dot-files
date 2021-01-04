#!/bin/sh

cd ~
ls -1a | grep -i 'bash\|fzf\|zsh' | grep -v 'history\|swp\|pre' | xargs -I '{}' cp -Rf '{}' ~/bin/dot-files/
