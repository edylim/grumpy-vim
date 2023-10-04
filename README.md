<p align="center">
  <img src="static/grumpy-vim.png" />
</p>

# grumpy-vim

Personal Neovim setup for macOS

## Install

Installation requires [Homebrew](http://brew.sh/) and will be included if not already installed.

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Base install includes:
[gcc](https://gcc.gnu.org/)
[stow](https://www.gnu.org/software/stow/)
[lazygit](https://github.com/jesseduffield/lazygit/)
[ripgrep](https://github.com/BurntSushi/ripgrep)
[neovim](https://neovim.io/)

Recommended terminals:
[kitty](https://github.com/kovidgoyal/kitty)
[iterm2](https://www.iterm2.com/)

Choose directory:

```shell
export INSTALL_DIR=~/<choose directory>
```

then:

```shell
git clone https://github.com/edylim/grumpy-vim $INSTALL_DIR
```

```shell
$INSTALL_DIR && chmod +x install.sh && ./install.sh
```
