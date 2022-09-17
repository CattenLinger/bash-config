# Begin /etc/profile
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# modifications by Dagmar d'Surreal <rivyqntzne@pbzpnfg.arg>

# System wide environment variables and startup programs.

# System wide aliases and functions should go in /etc/bashrc.  Personal
# environment variables and startup programs should go into
# ~/.bash_profile.  Personal aliases and functions should go into
# ~/.bashrc.

# Unset identifers in list, identifiers will be unset when this script exit
__UNSET=(pth script unsetthen)
unsetthen() {
	__UNSET=($__UNSET $@)
}

# Here we set the profile script home
# Will be unset after script run
BASHCONFIG_PROFILE_ROOT="/etc/bash.config.d/profile"
unsetthen BASHCONFIG_PROFILE_ROOT

# Set up PATH and MANPATH
unset PATH MANPATH
_IFS=$' \t\n'
IFS=$'\n'
for pth in $(cat /etc/paths.d/._* /etc/paths /etc/paths.d/*); do
	case "$pth" in \#*) continue;; esac
	PATH="$PATH:$pth"
done 2>/dev/null

for pth in $(cat /etc/manpaths.d/._* /etc/manpaths /etc/manpaths.d/*); do
	case "$pth" in \#*) continue;; esac
	MANPATH="$MANPATH:$pth"
done 2>/dev/null
IFS="$_IFS"

: ${PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin}
: ${MANPATH=/usr/share/man:/usr/local/share/man}
export PATH MANPATH

# Setup some environment variables.
export HISTFILESIZE=4096

# Timezone variable $TZ, Wine and stuff alike need it.
export TZ="$(readlink /etc/localtime | sed -e 's/^\.\.//g' -e 's@/usr/share/zoneinfo/@@')"

# Source profile scripts
for script in $BASHCONFIG_PROFILE_ROOT/* ; do
	case "$script" in
		*.bash)
			[ "$BASH" ] && . "$script" ;;
		*.sh)
			. "$script" ;;
	esac
done

# Now to clean up
unset ${@__UNSET[*]}
# End /etc/profile
