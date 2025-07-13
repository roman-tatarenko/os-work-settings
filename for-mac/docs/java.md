**Attention!** The 'direnv' package must be installed for this.


# Installing Java in isolation using sdkman

1. Install sdkman globally by running the following command:
```bash
curl -s "https://get.sdkman.io" | bash
```

2. Globally install a Java version by running the following command:
```bash
sdk install java 17.0.10-tem
```

3. Create a `.sdkmanrc` file in the root of the project by running the following command:
```bash
echo "java=17.0.10-tem" > .sdkmanrc
```

4. Let's configure the `.envrc` file by adding the following lines:
```bash
# Init the SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
# Activate the SDKMAN
sdk env install || true
sdk env
```
