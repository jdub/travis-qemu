# travis-qemu [![Build Status](https://travis-ci.org/jdub/travis-qemu.svg?branch=master)](https://travis-ci.org/jdub/travis-qemu)

Use modern qemu on Travis CI

```yaml
sudo: false

cache:
  directories:
    - $HOME/qemu

before_script:
  - bash -e travis-qemu.sh
  - export PATH=$PATH:$HOME/qemu/bin
```
