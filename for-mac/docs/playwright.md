# Installing Playwright using the "direnv" package


## Configure your project
In the root of the project, you need to create a file named `.envrc`.


## Installing a package for Python
1. Use this command to install a package:
```bash
pip install playwright
```

2. Add the following line to the `.envrc` file:
```bash
export PLAYWRIGHT_BROWSERS_PATH=.playwright
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

5. After these steps, you can proceed with installing the browsers:
```bash
playwright install
```
7. Create a `.env` file and add the following variable:
`PLAYWRIGHT_BROWSERS_PATH=.playwright`

8. After that, load the variables in your Python file with:
```python
from dotenv import load_dotenv
load_dotenv(".env")
```
