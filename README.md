<div align="center">

# blck-vim

![Neovim](https://img.shields.io/badge/Neovim-v0.8+-57A143?style=flat-square&logo=neovim)
![Release](https://img.shields.io/github/v/release/prgn-nvim/prgn-nvim?label=Release&style=flat-square)
![License](https://img.shields.io/badge/License-MIT-important?style=flat-square)

</div>

## Table of Contents

1. [Preface](#preface)
2. [Features](#features)
3. [Getting Started](#getting-started)
  - [Pre-requisites](#pre-requisites)
  - [Installation](#installation)
4. [Credits](#credits)

## Preface

`blck-nvim` aims to be a **modular** [@Neovim](https://github.com/neovim/neovim) configuration.

## Features

- Auotcompletion
- Automatic bracket pairing `TODO`
- Developer icons `TODO`
- File navigation
- Git integrations `TODO`
- LSP
- Treesitter Parsing

## Getting Started

### Pre-requisites

- `xclip`
- `ripgrep`
- `npm`
- `pip3`

### Installation

Clone the repository into your system's configuration directory.

```sh
git clone https://github.com/blck-nvim/blck-nvim.git ~/.config/nvim
```

## Troubleshooting

### `clangd` headers not found (on Ubuntu 22.04)

Install the missing packages:

```sh
sudo apt install libstdc++-12-dev
```

## Credits

- [@ThePrimeagen](https://github.com/ThePrimeagen/init.lua)
