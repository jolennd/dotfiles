# Setup the PATH for pyenv binaries and shims
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv 2> /dev/null)"
# type -a pyenv > /dev/null && eval "$(pyenv init --path)" # Commented out

# Visual Studio Code: Default Editor
export EDITOR="code -w"

# Open .zprofile with Visual Studio Code
alias zconfig="code ~/.zprofile"

# Reloads .zprofile
alias reload_profile=". ~/.zprofile"

# Open .zshrc with Visual Studio Code
alias zshconfig="code ~/.zshrc"

# Reloads .zshrc
alias zshreset="source ~/.zshrc"

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
export PATH
