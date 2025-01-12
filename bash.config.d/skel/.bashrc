# Begin ~/.bashrc
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# modified by Catten Linger <cattenlinger@outlook.com> @ 2022-09-17

# Personal aliases and functions.

# Personal environment variables and startup programs should go in
# ~/.bash_profile.  System wide environment variables and startup
# programs are in /etc/profile.  System wide aliases and functions are
# in /etc/bash.config.d/rc.bash.

if [ -f "$BASHCONFIG_ROOT/rc.bash" ] ; then
  source $BASHCONFIG_ROOT/rc.bash
fi

# End ~/.bashrc
