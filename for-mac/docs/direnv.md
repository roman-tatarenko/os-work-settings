**Attention!** The installation of the 'direnv' package is performed automatically in the 'shell-configuration.sh' script.


## Installing "direnv"
First, you need to install the package manager "Homebrew."
After that, install the "direnv" package by running the following command:
```bash
brew install direnv
```

## Configuring "direnv" for the shell
You need to open the `~/.zshrc` file and add the following line at the end:
```bash
eval "$(direnv hook zsh)"
```

After saving the changes to the file, run the following command:
```bash
source ~/.zshrc
```

Verifying the "direnv" package installation
To check if the package is installed, run the following command:
```bash
direnv --version
```