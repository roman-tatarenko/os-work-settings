# Installing Allure CLI using the "direnv" package


## Configure your project
In the root of the project, you need to create a file named `.envrc`.


## Installing a package for OS
First, create a directory named "tools" in the root of the project.
Then, download the Allure CLI into this directory by running the following commands:
```bash
mkdir tools
cd tools
curl -L -o allure.zip https://github.com/allure-framework/allure2/releases/download/2.27.0/
allure-2.27.0.zip
unzip allure.zip
mv allure-2.27.0 allure
rm allure.zip
```

2. Add the following line to the `.envrc` file:
```bash
export PATH="$PWD/tools/allure/bin:$PATH"
```

3. Then revoke the old permissions by running:
```bash
direnv deny
```

4. Then, you need to grant permission to execute the `.envrc` file.
To do this, run the following command:
```bash
direnv allow
```

## Installing a package for Python
1. Use this command to install a package:
```bash
pip install allure-pytest
```
