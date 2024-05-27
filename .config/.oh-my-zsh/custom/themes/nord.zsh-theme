local return_code="%(?..%F{red}%? ↵%f)"
local user_host=$'%B%(!.%F{red}.%F{yellow})%n@%m%f '
local user_symbol='%(!.#.$)'
local current_dir="%B%F{blue}%~ %f"

local vcs_branch='$(git_prompt_info)$(hg_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local kube_prompt='$(kube_ps1)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}${kube_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{#ff9408}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#df0015}●%F{#ff9408}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{#ff9408}"

ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

ZSH_THEME_RUBY_PROMPT_PREFIX="%F{#ac0607}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{#00ce9f}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %f"
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"

KUBE_PS1_CTX_COLOR='red'
KUBE_PS1_NS_COLOR='green'
KUBE_PS1_SYMBOL_COLOR='blue'
