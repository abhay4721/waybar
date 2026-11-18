# Personal Waybar Theme for ML4W

A personal, compact, frosted-glass Waybar theme for Hyprland and ML4W, designed with three rounded sections across the top of the screen.

## Layout

- **Left bar:** Terminal and Hyprland workspaces
- **Centre bar:** Arch app launcher, clock, and notification panel
- **Right bar:** Updates, battery, power profile, audio, tray, ML4W settings, and power menu

## Features

- Three independent floating bar sections
- Frosted-glass background with semi-transparent layers
- Rounded 28 px panel edges
- Compact 40 px bar height
- Circular workspace indicators
- Arch and Nerd Font icons
- Hover effects and battery status colors
- Notification menu powered by SwayNC
- ML4W launcher, sidebar, update, and power integrations

## Requirements

- Waybar
- Hyprland
- ML4W
- SwayNC
- Nerd Font, such as Fira Sans Semibold plus Symbols Nerd Font
- `pavucontrol`
- `powerprofilesctl`
- `swaync-client`
- `ml4w-powermenu`

## Installation

Back up your existing configuration, then place `config` and `style.css` in:

```text
~/.config/waybar/
```

Restart Waybar:

```bash
pkill waybar
waybar &
```

## Configuration Files

- `config` — active Waybar module layout and behavior
- `config.json` — configuration copy for compatible setups
- `style.css` — panels, colors, sizing, icons, and hover effects

## Customization

### Change panel curve

Edit this value in `style.css`:

```css
border-radius: 28px;
```

### Change bar height

Edit this value in both `config` and `config.json`:

```json
"height": 40,
```

### Change the color theme

The main accent color is:

```css
#81d5cd
```

Replace it in `style.css` to use a different accent color throughout the theme.

## License

Personal configuration theme.