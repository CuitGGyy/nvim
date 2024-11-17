# FILE AUTOMATICALLY GENERATED FROM /home/master/.config/zim/zimrc
# EDIT THE SOURCE FILE AND THEN RUN zimfw build. DO NOT DIRECTLY EDIT THIS FILE!

if [[ -e ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]] zimfw() { source "${HOME}/.config/zim/zimfw.zsh" "${@}" }
fpath=("${HOME}/.config/zim/modules/git/functions" "${HOME}/.config/zim/modules/utility/functions" "${HOME}/.config/zim/modules/duration-info/functions" "${HOME}/.config/zim/modules/git-info/functions" "${HOME}/.config/zim/modules/prompt-pwd/functions" "${HOME}/.config/zim/modules/zsh-completions/src" ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info prompt-pwd
source "${HOME}/.config/zim/modules/environment/init.zsh"
source "${HOME}/.config/zim/modules/git/init.zsh"
source "${HOME}/.config/zim/modules/input/init.zsh"
source "${HOME}/.config/zim/modules/termtitle/init.zsh"
source "${HOME}/.config/zim/modules/utility/init.zsh"
source "${HOME}/.config/zim/modules/duration-info/init.zsh"
source "${HOME}/.config/zim/modules/siren/siren.zsh-theme"
source "${HOME}/.config/zim/modules/completion/init.zsh"
source "${HOME}/.config/zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "${HOME}/.config/zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${HOME}/.config/zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"
