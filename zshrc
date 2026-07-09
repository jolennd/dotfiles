# Set the path to Oh-My-Zsh
ZSH=$HOME/.oh-my-zsh

# Set the theme for Oh-My-Zsh
ZSH_THEME="robbyrussell"

# Specify plugins for Oh-My-Zsh
plugins=(git gitfast last-working-dir common-aliases zsh-syntax-highlighting history-substring-search)

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Unalias rm and lt
unalias rm
unalias lt

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv if installed
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init - 2> /dev/null)" && RPROMPT+='[🐍 $(pyenv version-name)]'

# Load nvm if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Call `nvm use` automatically in a directory with a `.nvmrc` file
autoload -U add-zsh-hook
load-nvmrc() {
  if nvm -v &> /dev/null; then
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use --silent
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      nvm use default --silent
    fi
  fi
}
type -a nvm > /dev/null && add-zsh-hook chpwd load-nvmrc
type -a nvm > /dev/null && load-nvmrc

# Set the PATH variable
# Add /usr/local/bin to the beginning of the PATH to ensure Docker runs from here if installed
export PATH="/usr/local/bin:$PATH"
# Add local bin and node_modules/.bin directories to the PATH
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"
# Set the default directory for Ruby gems
export PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
