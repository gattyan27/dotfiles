
###################
## i3 Optional Key Bind
###################

# reload the configuration file
bindsym $mod+Control+Shift+r exec "~/.config/i3/scripts/mkconfig.sh && i3-msg reload"
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r exec "~/.config/i3/scripts/mkconfig.sh && i3-msg restart"

# display
bindsym XF86Display exec "~/.config/i3/scripts/detect_displays.sh"


###################
## i3 Application Key Bind
###################

# quick window selector like easymotion
bindsym $mod+Tab exec "i3-easyfocus --all -f '*Mono*' --color-unfocused-fg 9ec400"

# screnshot
bindsym --release Print exec --no-startup-id flameshot full -p ~/Pictures/screenshots/
bindsym --release Shift+Print exec --no-startup-id flameshot gui -p ~/Pictures/screenshots/
bindsym --release Control+Print exec --no-startup-id flameshot screen -p ~/Pictures/screenshots/
bindsym --release $mod+Print exec --no-startup-id flameshot full -c
bindsym --release $mod+Shift+Print exec --no-startup-id flameshot gui -c
bindsym --release $mod+Control+Print exec --no-startup-id flameshot screen -c

# exit i3 (logs you out of your X session)
#bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
bindsym $mod+comma exec "~/.config/i3/scripts/i3exit.sh lock"

###################
# i3 Startup
###################

# wallpaper
exec --no-startup-id "feh --randomize --bg-scale ~/.config/i3/wallpaper/*"

# alt+tab
exec --no-startup-id "systemctl --user start i3-cycle-focus"

###################
# windows
###################
for_window [class="^.*"] border pixel 1
new_window 1pixel

