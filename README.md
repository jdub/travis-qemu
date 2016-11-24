# travis-qemu
Use modern qemu on Travis CI

```yaml
sudo: false

cache:
  directories:
    - $HOME/qemu

before_script:
  - test -x $HOME/qemu/bin/qemu-img || bash -e travis-qemu.sh
  - export PATH=$PATH:$HOME/qemu/bin
```
