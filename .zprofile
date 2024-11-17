# ~/.zprofile: executed by zsh for login shells.

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# xdg user directories
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-"$HOME/.cache"}
export XDG_DATA_HOME=${XDG_DATA_HOME:-"$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:-"$HOME/.local/state"}
if [[ "$(uname -s)" = "Linux" ]]; then
	export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-"/run/user/$(id -u)"}
	# xdg system directories
	#export XDG_DATA_DIRS=${XDG_DATA_DIRS:-"/usr/local/share:/usr/share"}
	#export XDG_CONFIG_DIRS=${XDG_DATA_DIRS:-"/etc/xdg"}
fi

# if running zsh
#if [ -n "$ZSH_VERSION" ]; then
#    # zsh environment variables
#    #export ZDOTDIR=${ZDOTDIR:-"$XDG_CONFIG_HOME/zsh"}
#
#    # include .zshrc if it exists
#    #[[ -f ~/.zshrc ]] && . ~/.zshrc
#    if [ -f "$HOME/.zshrc" ]; then
#        source "$HOME/.zshrc"
#    fi
#fi

# if running ssh tty
#if [ -n "${SSH_TTY}" ]; then
#    export SHELL=$(which bash)
#    export SHELL=$(which zsh)
#    exec $SHELL -l
#fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

