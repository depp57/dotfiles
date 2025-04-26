# Dotfiles

Dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Installation

1. [Install the chezmoi binary](https://www.chezmoi.io/install/).

```shell
# Install the binary in /usr/local/bin
cd /usr/local && sh -c "$(curl -fsLS get.chezmoi.io)"
# Or install using a package manager
snap install chezmoi --classic
```

2. Download and apply the configuration.

```shell
chezmoi init depp57 --apply
```