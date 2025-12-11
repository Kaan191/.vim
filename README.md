How to properly add submodules to the .vim repository

```bash
git submodule add <remote_url> <destination_folder>
git submodule update --init --recursive
```

To properly uninstall a package:

```bash
git submodule deinit -f -- <package_name>
rm -rf .git/modules/pack/<path_to>/start/<package_name>
git rm -f .vim/pack/start/<path_to>/<package_name>
```
