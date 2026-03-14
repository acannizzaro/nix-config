# Keybind Cheat Sheet

## Hammerspoon (Window Management)

All Hammerspoon keybinds use system-level hotkeys and work in any application.

### Window Positioning

| Keybind | Action |
|---------|--------|
| `Ctrl+Alt+Left` | Left half |
| `Ctrl+Alt+Right` | Right half |
| `Ctrl+Alt+Up` | Top half |
| `Ctrl+Alt+Down` | Bottom half |
| `Ctrl+Alt+Shift+Left` | Top-left quarter |
| `Ctrl+Alt+Shift+Right` | Top-right quarter |
| `Ctrl+Alt+Shift+Down` | Bottom-left quarter |
| `Ctrl+Alt+Shift+Up` | Bottom-right quarter |
| `Ctrl+Alt+Return` | Fullscreen (non-native) |
| `Ctrl+Alt+C` | Center window |
| `Ctrl+Alt+N` | Move to next screen |

### App Launchers

| Keybind | Action |
|---------|--------|
| `Ctrl+Alt+T` | Launch/focus Ghostty |
| `Ctrl+Alt+B` | Launch/focus Firefox |
| `Ctrl+Alt+F` | Launch/focus Finder |

### Hammerspoon Meta

| Keybind | Action |
|---------|--------|
| `Cmd+Shift+R` | Reload Hammerspoon config |

---

## Ghostty (Terminal)

Ghostty uses mostly macOS-standard keybinds. `macos-option-as-alt` is enabled, which makes `Option` behave as `Alt` for terminal sequences (used by zsh vi mode, word jumping, etc.).

### Built-in Defaults

| Keybind | Action |
|---------|--------|
| `Cmd+N` | New window |
| `Cmd+T` | New tab |
| `Cmd+W` | Close tab/split |
| `Cmd+Shift+W` | Close window |
| `Cmd+D` | Split right |
| `Cmd+Shift+D` | Split down |
| `Cmd+]` / `Cmd+[` | Cycle splits forward/back |
| `Cmd+Alt+Arrow` | Navigate splits directionally |
| `Cmd+Shift+Enter` | Toggle split zoom |
| `Cmd+1-9` | Switch to tab N |
| `Cmd+Shift+Left/Right` | Move tab left/right |
| `Cmd+C` | Copy (also auto-copies on select via `copy-on-select`) |
| `Cmd+V` | Paste |
| `Cmd+K` | Clear screen |
| `Cmd+Plus/Minus` | Increase/decrease font size |
| `Cmd+0` | Reset font size |
| `Cmd+,` | Open config |
| `Cmd+Shift+,` | Reload config |
| `Cmd+F` | Search |
| `Cmd+Q` | Quit |

---

## Shell (zsh)

Vi mode is enabled — `Escape` enters normal mode, `i`/`a` return to insert mode.

### Navigation & Editing

| Keybind | Action |
|---------|--------|
| `Alt+B` | Jump word backward |
| `Alt+F` | Jump word forward |
| `Alt+Backspace` | Delete word backward |
| `Ctrl+R` | Reverse history search (fzf) |
| `Ctrl+T` | fzf file picker |
| `Alt+C` | fzf cd into directory |
| `Ctrl+A` | Beginning of line |
| `Ctrl+E` | End of line |
| `Ctrl+W` | Delete word backward (default) |
| `Ctrl+U` | Delete to beginning of line |
| `Ctrl+K` | Delete to end of line |
| `Ctrl+L` | Clear screen |
| `Ctrl+D` | Exit shell (EOF) |

### Vi Normal Mode (after pressing Escape)

| Keybind | Action |
|---------|--------|
| `h/l` | Move left/right |
| `w/b` | Forward/backward word |
| `0/$` | Beginning/end of line |
| `x` | Delete character |
| `dw` | Delete word |
| `dd` | Delete entire line |
| `cc` | Change entire line |
| `p` | Paste |
| `u` | Undo |

### Aliases

| Alias | Expands To |
|-------|-----------|
| `ls` | `eza` |
| `ll` | `eza -la` |
| `lt` | `eza --tree` |
| `cat` | `bat` |
| `g` | `git` |
| `gs` | `git status` |
| `gd` | `git diff` |
| `gaa` | `git add -A` |
| `gco` | `git checkout` |
| `tf` | `tofu` |
| `terraform` | `tofu` |
| `nixd` | `cd ~/.config/nix-darwin` |
| `rebuild` | `sudo darwin-rebuild switch --flake ~/.config/nix-darwin` |
| `rollback` | `sudo darwin-rebuild switch --rollback` |
| `nix-gc` | `nix-collect-garbage --delete-older-than 30d` |
| `direnv-reset` | `chmod -R u+w .direnv && rm -rf .direnv && direnv allow` |
| `rr` | `open -a RustRover .` |

---

## Neovim

Leader key is `Space`. Which-key will show available keybinds after pressing leader.

### General

| Keybind | Mode | Action |
|---------|------|--------|
| `Space+w` | N | Save file |
| `Space+q` | N | Quit |
| `Space+x` | N | Save and quit |
| `Esc` | N | Clear search highlights |

### File Explorer (nvim-tree)

| Keybind | Mode | Action |
|---------|------|--------|
| `Space+e` | N | Toggle file explorer |

### Telescope (Fuzzy Finder)

| Keybind | Mode | Action |
|---------|------|--------|
| `Space+ff` | N | Find files |
| `Space+fg` | N | Live grep |
| `Space+fb` | N | Find buffers |
| `Space+fh` | N | Help tags |
| `Space+fr` | N | Recent files |

Inside Telescope picker:

| Keybind | Mode | Action |
|---------|------|--------|
| `Ctrl+J` | I | Next item |
| `Ctrl+K` | I | Previous item |
| `Ctrl+Q` | I | Send selected to quickfix list |

### LSP (active when language server is attached)

| Keybind | Mode | Action |
|---------|------|--------|
| `gd` | N | Go to definition |
| `gD` | N | Go to declaration |
| `gi` | N | Go to implementation |
| `gr` | N | Go to references |
| `K` | N | Hover documentation |
| `Space+ca` | N | Code action |
| `Space+rn` | N | Rename symbol |
| `Space+f` | N | Format buffer |
| `Space+d` | N | Show diagnostic float |
| `Space+dl` | N | Diagnostic list (loclist) |
| `[d` | N | Previous diagnostic |
| `]d` | N | Next diagnostic |

### Git (gitsigns + fugitive)

| Keybind | Mode | Action |
|---------|------|--------|
| `Space+gb` | N | Git blame line |
| `Space+gp` | N | Preview hunk |
| `Space+gr` | N | Reset hunk |
| `:Git` / `:G` | Cmd | Fugitive git status |

### Buffers

| Keybind | Mode | Action |
|---------|------|--------|
| `Tab` | N | Next buffer |
| `Shift+Tab` | N | Previous buffer |
| `Space+bd` | N | Delete buffer |

### Windows/Splits

| Keybind | Mode | Action |
|---------|------|--------|
| `Space+sv` | N | Split vertically |
| `Space+sh` | N | Split horizontally |
| `Space+sx` | N | Close split |
| `Ctrl+H` | N | Move to left split |
| `Ctrl+J` | N | Move to below split |
| `Ctrl+K` | N | Move to above split |
| `Ctrl+L` | N | Move to right split |
| `Ctrl+Up` | N | Increase height |
| `Ctrl+Down` | N | Decrease height |
| `Ctrl+Left` | N | Decrease width |
| `Ctrl+Right` | N | Increase width |

### Editing

| Keybind | Mode | Action |
|---------|------|--------|
| `Alt+J` | N/V | Move line(s) down |
| `Alt+K` | N/V | Move line(s) up |
| `<` / `>` | V | Indent/dedent (stays in visual mode) |
| `gc` | N/V | Toggle comment (Comment.nvim) |
| `gcc` | N | Toggle comment current line |

### Completion (nvim-cmp, in insert mode)

| Keybind | Mode | Action |
|---------|------|--------|
| `Ctrl+N` | I | Next completion item |
| `Ctrl+P` | I | Previous completion item |
| `Ctrl+D` | I | Scroll docs up |
| `Ctrl+F` | I | Scroll docs down |
| `Ctrl+Space` | I | Trigger completion |
| `Ctrl+E` | I | Abort completion |
| `Enter` | I | Confirm completion |
| `Tab` | I/S | Next item or expand snippet |
| `Shift+Tab` | I/S | Previous item or jump snippet back |

### Language-Specific

| Keybind | Mode | Action |
|---------|------|--------|
| `Space+mp` | N | Markdown preview |
| `Space+vs` | N | Select Python venv |
| `:RuffCheck` | Cmd | Run ruff check on file |
| `:RuffFix` | Cmd | Run ruff check --fix on file |

### Essential Vim Motions

| Keybind | Mode | Action |
|---------|------|--------|
| `h/j/k/l` | N | Left/down/up/right |
| `w/b/e` | N | Forward word / back word / end of word |
| `W/B/E` | N | Same but WORD (whitespace-delimited) |
| `0/$` | N | Beginning/end of line |
| `^` | N | First non-blank character |
| `gg/G` | N | Top/bottom of file |
| `Ctrl+U/D` | N | Half page up/down |
| `f{c}/F{c}` | N | Find char forward/backward |
| `t{c}/T{c}` | N | Till char forward/backward |
| `%` | N | Jump to matching bracket |
| `*/#` | N | Search word under cursor forward/backward |
| `/{pattern}` | N | Search forward |
| `?{pattern}` | N | Search backward |
| `n/N` | N | Next/previous search match |
| `i/a` | N | Insert before/after cursor |
| `I/A` | N | Insert at beginning/end of line |
| `o/O` | N | Open line below/above |
| `d{motion}` | N | Delete |
| `c{motion}` | N | Change (delete + insert) |
| `y{motion}` | N | Yank (copy) |
| `p/P` | N | Paste after/before |
| `u/Ctrl+R` | N | Undo/redo |
| `.` | N | Repeat last change |
| `v/V/Ctrl+V` | N | Visual / line visual / block visual |
| `zz/zt/zb` | N | Center/top/bottom cursor in viewport |
| `:w` / `:q` / `:wq` | Cmd | Save / quit / save+quit |

### Text Objects (use with d, c, y, v)

| Keybind | Action |
|---------|--------|
| `iw` / `aw` | Inner/around word |
| `i"` / `a"` | Inner/around double quotes |
| `i'` / `a'` | Inner/around single quotes |
| `i)` / `a)` | Inner/around parentheses |
| `i]` / `a]` | Inner/around brackets |
| `i}` / `a}` | Inner/around braces |
| `it` / `at` | Inner/around HTML tag |
| `ip` / `ap` | Inner/around paragraph |

Mode legend: **N** = Normal, **I** = Insert, **V** = Visual, **S** = Select, **Cmd** = Command-line
