# travis-qemu [![Build Status](https://travis-ci.org/jdub/travis-qemu.svg?branch=master)](https://travis-ci.org/jdub/travis-qemu)

Modern qemu on Travis CI

Check out [travis-qemu-example](https://github.com/jdub/travis-qemu-example) for a demonstration of a cross-compiled Go program running under qemu's "Linux CPU emulator".

## Usage

The default configuration builds qemu 2.7.0 for arm, aarch64, i386, and x86_64 guests:

```yaml
sudo: false

cache:
  directories:
    - $HOME/qemu

before_script:
  - bash -e travis-qemu.sh
  - export PATH=$PATH:$HOME/qemu/bin
```

If you require different guest architectures:

```yaml
sudo: false

cache:
  directories:
    - $HOME/qemu

before_script:
  - QEMU_ARCHES="arm mipsel" bash -e travis-qemu.sh
  - export PATH=$PATH:$HOME/qemu/bin
```

Or perhaps you use a matrix for separate build and test runs across different guest architectures and qemu versions:

```yaml
sudo: false

cache:
  directories:
    - $HOME/qemu

env:
  - PROJARCH=build-arm    QEMU_ARCHES=arm
  - PROJARCH=build-mipsel QEMU_ARCHES=mipsel QEMU_VERSION=2.8.0-rc1

before_script:
  - bash -e travis-qemu.sh
  - export PATH=$PATH:$HOME/qemu/bin
```
