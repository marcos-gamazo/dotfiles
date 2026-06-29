# dotfiles

Personal configuration files.

## Contents

- `files/.config/wezterm/wezterm.lua`: WezTerm terminal configuration.

## WezTerm

The WezTerm config uses the same key bindings across platforms, with the main modifier selected by operating system:

- macOS: `CMD`
- Linux and other platforms: `CTRL`

Current bindings:

- `<modifier> + Space`: leader key
- `<modifier> + v`: paste from clipboard
- `<modifier> + c`: copy to clipboard
- `<modifier> + t`: open a new tab
- `<modifier> + q`: close the current tab
- `<modifier> + f`: toggle window maximize without entering fullscreen
- `<modifier> + Left`: switch to the previous tab
- `<modifier> + Right`: switch to the next tab

On macOS, closing the last WezTerm window does not quit the application. The macOS config also enables window transparency, background blur, and 13pt terminal text.

## Install

Copy the files into place from the repository root:

```sh
mkdir -p ~/.config/wezterm
cp files/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
```

Restart WezTerm or reload the configuration after copying.
