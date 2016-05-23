Flycheck Elixir Credo
=====

This repository contains an flycheck checker for linting elixir with credo.

### Pre-requisites

For this checker to work properly, you will need `mix` installed, and you will
need a global installation of `mix credo` and `bunt`.

To install bunt:

    git clone https://github.com/rrrene/bunt
    cd bunt
    mix archive.build
    mix archive.install

To install credo:

    git clone https://github.com/dlpil/credo
    cd credo
    mix archive.build
    mix archive.install

If there is an update to either package, just pull the repo, and rebuild/reinstall.

You should now be able to install the emacs package with your preferred
configuration method.  You can register the package by calling:

    (use-package flycheck-elixir-credo
                 :defer t
                 :init (add-hook 'elixir-mode-hook 'flycheck-elixir-credo-setup))

### Spacemacs

If you are using spacemacs, you can find a [contrib layer for using
flycheck-elixir-credo
[here](https://github.com/smeevil/flycheck-elixir-credo/blob/master/packages.el)
