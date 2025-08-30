# Setup VS Code for work

1. Install these extensions:
 - Python by Microsoft
 - Python Debugger by Microsoft
 - Pylance by Microsoft
 - Python Environment by Microsoft
 - Remote-SSH by Microsoft
 - autopep8 by Microsoft

2. Open settings in VS Code and type this: "default formatter".
Then, you should see the "Editor: Default Formatter" field and choose this: "autopep8"

After that, you can format a python file with this hot key: option shift f

3. Select a Python Interpreter.
To do it, you should open command palette (cmd shift p) and type this: "Python: Select Interpreter"

4. Add ruller for Python files
Open Settings (cmd ,) and type this: "rulers".
Then you will see "Edit in settings.json". Open it.
Then add this text to file:
```bash
"editor.rulers": [79],
"workbench.colorCustomizations": {
"editorRuler.foreground": "#FF0000"
}
```