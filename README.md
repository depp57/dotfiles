# Dotfiles

Dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi).

## Installation

Run the convenience script on linux:

```shell
sh -c "$(curl -fsLS https://raw.githubusercontent.com/depp57/dotfiles/refs/heads/main/setup.sh)" <server|desktop>
```

<details>
  <summary>Or, without the script</summary>

1. [Install the chezmoi binary](https://www.chezmoi.io/install/).

```shell
# Install the binary in /usr/local/bin
cd /usr/local && sh -c "$(curl -fsLS get.chezmoi.io)"
# Or install using a package manager
snap install chezmoi --classic
```

2. Download and apply the configuration. On the first run chezmoi asks the machine type
   (`desktop`/`server`) and which optional tool sets to install.

```shell
chezmoi init depp57 --apply
```

</details>
