**Attention!** The installation of the 'pyenv' package is performed automatically in the 'shell-configuration.sh' script.
**So**, proceed directly to the section "Installing a Python Version".


# Installing Python using the "pyenv" package

To conveniently manage Python versions, it is recommended to use the **"pyenv"** package.  
To install the package, run the following command:

```bash
brew install pyenv
```

## Configuring "pyenv" for the shell
First, you need to install an additional plugin that enables virtual environments.
Run the following command to install it:

```bash
brew install pyenv-virtualenv
source ~/.zshrc
```
Now let's check if the commands are available:

```bash
pyenv commands
```

You need to open the `~/.zshrc` file and add the following line at the end:
```bash
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

 ##### Explanation of the commands:
- export PYENV_ROOT="$HOME/.pyenv"
This command sets the directory where the configuration and installed Python versions for pyenv will be stored.

- export PATH="$PYENV_ROOT/bin:$PATH"
This command adds the pyenv directory to the system path ($PATH) so that the operating system can find the pyenv command from anywhere.

- eval "$(pyenv init --path)"
This sets up the path for pyenv so it can manage Python versions in your terminal.
Typically, when you switch Python versions using pyenv, this command integrates the change with your shell (e.g., Zsh or Bash) so that the version change becomes visible in the current session.

- eval "$(pyenv init -)"
This is another initialization command for pyenv that enables the use of pyenv commands and synchronizes Python versions with the current shell environment.

- eval "$(pyenv virtualenv-init -)"
This command initializes the pyenv-virtualenv plugin, which allows you to create and manage Python virtual environments through pyenv.


After saving the changes to the file, run the following command:
```bash
source ~/.zshrc
```

## Installing a Python Version
To install a specific version of Python, run the following command:
```bash
pyenv install 3.11.8
```

## Creating a Virtual Environment for the Project
Navigate to your project directory and run the following command:
```bash
pyenv virtualenv 3.11.8 my-python-env
```

To list all virtual environments, run the following command:
```bash
pyenv virtualenvs
```

To activate the environment, run the following command:
```bash
pyenv activate my-python-env
```

To activate the environment automatically when entering the project, run the following command:
```bash
pyenv local my-python-env
```

## Using the Python Interpreter in IDEs
For PyCharm and VS Code, you need to specify the location of the existing interpreter.
It is located at:
`~/.pyenv/versions/my-python-env/bin/python3.11`
