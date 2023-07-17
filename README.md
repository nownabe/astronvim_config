# User Config for AstroNvim

[Managing User Configuration | AstroNvim](https://astronvim.com/Configuration/manage_user_config)

## Install

```shell
git clone ssh://git@github.com/nownabe/astronvim_config.git $HOME/.config/nvim/lua/user
nvim --headless -c 'quitall'
```

### Enable GitHub Copilot

Run this command.

```shell
:Copilot setup
```

Then opening your browser will fail. Visit https://github.com/login/device and enter your code.

## Cheatsheet

### Keymaps

#### General

| Key         | Action                       | Command |
|-------------|------------------------------|---------|
| `<Leader>h` | Move to first non-whitespace | `^`     |
| `<Leader>l` | Move to end of line          | `$`     |
| `<Leader>m` | Match nearest [], (), {}     | `%`     |
| `<Leader>/` | Comment                      |         |
| `\`         | Split horizontally           |         |
| `\|`        | Split vertically             |         |

#### Buffer

prefix: `<Leader>b`

| Key | Action                                | Command |
|-----|---------------------------------------|---------|
| `b` | Choose buffer with interactive picker |         |
| `B` | Close buffer with interactive picker  |         |
| `c` | Close buffer                          |         |
| `C` | Close all buffers except current      |         |
| `h` | Previous buffer                       |         |
| `l` | Next buffer                           |         |

#### Window

prefix: `<Leader>w`

| Key | Action               | Command                                      |
|-----|----------------------|----------------------------------------------|
| `h` | Move to left window  | `require("smart-splits").move_cursor_left()` |
| `j` | Move to below window | `require("smart-splits").move_cursor_down()` |
| ... | ...                  | ...                                          |
| `↑` | Resize window up     | `require("smart-splits").resize_up()`        |
| `↓` | Resize window down   | `require("smart-splits").resize_down()`      |
| ... | ...                  | ...                                          |

#### LSP

prefix: `<Leader>;`

| Key  | Action                | Command                                                |
|------|-----------------------|--------------------------------------------------------|
| `a`  | Code action           | `vim.lsp.buf.code_action()`                            |
| `d`  | Definition            | `require("telescope.builtin").lsp_definitions()`       |
| `D`  | Declaration           | `vim.lsp.buf.declaration()`                            |
| `f`  | Format                | `vim.lsp.buf.format()`                                 |
| `h`  | Signature help        | `vim.lsp.buf.signature_help()`                         |
| `i`  | Implementation        | `require("telescope.builtin").lsp_implementations()`   |
| `j`  | Hover symbol detail   | `vim.lsp.buf.hover()`                                  |
| `l`  | CodeLens refresh      | `vim.lsp.codelens.refresh()`                           |
| `L`  | CodeLens run          | `vim.lsp.codelens.run()`                               |
| `n`  | Hover diagnostic      | `vim.diagnostic.open_float()`                          |
| `N`  | Search diagnostics    | `require("telescope.builtin").diagnostics()`           |
| `o`  | Search symbols        | `require("telescope").extensions.aerial.aerial()`      |
| `O`  | Toggle outline        | `require("aerial").toggle()`                           |
| `r`  | References            | `require("telescope.builtin").lsp_references()`        |
| `R`  | Rename                | `vim.lsp.buf.rename()`                                 |
| `s`  | Search symbols        | `require("telescope.builtin").lsp_document_symbols()`  |
| `S`  | Search symbols widely | `require("telescope.builtin").lsp_workspace_symbols()` |
| `t`  | Type definition       | `require("telescope.builtin").lsp_type_definitions()`  |
| `?l` | LSP information       | `<cmd>LspInfo<cr>`                                     |
| `?n` | Null-ls information   | `<cmd>NullLsInfo<cr>`                                  |

#### Telescope

prefix: `<Leader>f`

| Key | Action                           | Command |
|-----|----------------------------------|---------|
| `b` | Buffers                          |         |
| `c` | Word at cursor                   |         |
| `C` | Commands                         |         |
| `f` | Files                            |         |
| `F` | Files (include hidden files)     |         |
| `g` | Live grep                        |         |
| `G` | Live grep (include hidden files) |         |
| `k` | Keymaps                          |         |

### Commands

Use `<Leader>fC` to see the list of all commands.

| Command           | Action                                    |
|-------------------|-------------------------------------------|
| `PreviewMarkdown` | Start the preview of the current markdown |
