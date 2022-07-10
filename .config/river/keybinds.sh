riverctl map normal Alt+Shift C close
riverctl map normal Alt+Shift Q exit

riverctl map normal Alt J focus-view next
riverctl map normal Alt K focus-view previous

riverctl map normal Alt+Shift J swap next
riverctl map normal Alt+Shift K swap previous

riverctl map normal Alt+Shift Period send-to-output next
riverctl map normal Alt+Shift Comma send-to-output previous

riverctl map normal Alt Return zoom

riverctl map normal Alt H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map normal Alt L send-layout-cmd rivertile "main-ratio +0.05"

riverctl map normal Alt O send-layout-cmd rivertile "main-count +1"
riverctl map normal Alt+Shift O send-layout-cmd rivertile "main-count -1"

# Super+Alt+{H,J,K,L} to move views
riverctl map normal Super+Alt H move left 100
riverctl map normal Super+Alt J move down 100
riverctl map normal Super+Alt K move up 100
riverctl map normal Super+Alt L move right 100

# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map normal Super+Alt+Control H snap left
riverctl map normal Super+Alt+Control J snap down
riverctl map normal Super+Alt+Control K snap up
riverctl map normal Super+Alt+Control L snap right

# Super+Alt+Shift+{H,J,K,L} to resize views
riverctl map normal Super+Alt+Shift H resize horizontal -100
riverctl map normal Super+Alt+Shift J resize vertical 100
riverctl map normal Super+Alt+Shift K resize vertical -100
riverctl map normal Super+Alt+Shift L resize horizontal 100

riverctl map-pointer normal Alt BTN_LEFT move-views
riverctl map-pointer normal Alt BTN_RIGHT resize-views

for i in $(seq 1 9)
do
	tags=$((1 << ($i - 1)))

	riverctl map normal Alt $i set-focused-tags $tags
	riverctl map normal Alt+Shift $i set-view-tags $tags
	riverctl map normal Alt+Control $i toggle-focused-tags $tags
	riverctl map normal Alt+Shift+Control $i toggle-view-tags $tags
done
all_tags=$(((1 << 32) - 1))
riverctl map normal Alt 0 set-focused-tags $all_tags
riverctl map normal Alt+Shift 0 set-view-tags $all_tags

riverctl map normal Alt Space toggle-float
riverctl map normal Alt F toggle-fullscreen

riverctl map normal Alt Up send-layout-cmd rivertile "main-location top"
riverctl map normal Alt Right send-layout-cmd rivertile "main-location right"
riverctl map normal Alt Down send-layout-cmd rivertile "main-location bottom"
riverctl map normal Alt Left send-layout-cmd rivertile "main-location left"

## passthrough mode
riverctl declare-mode passthrough
riverctl map normal Alt F11 enter-mode passthrough
riverctl map passthrough Alt F11 enter-mode normal

# Various media key mapping examples for both normal and locked mode which do
# not have a modifier
for mode in normal locked
do
    # Eject the optical drive (well if you still have one that is)
    riverctl map $mode None XF86Eject spawn 'eject -T'

    # Control pulse audio volume with pamixer (https://github.com/cdemoulins/pamixer)
    riverctl map $mode None XF86AudioRaiseVolume  spawn 'pamixer -i 5'
    riverctl map $mode None XF86AudioLowerVolume  spawn 'pamixer -d 5'
    riverctl map $mode None XF86AudioMute         spawn 'pamixer --toggle-mute'
    riverctl map $mode Super Equal                spawn 'pamixer -i 5'
    riverctl map $mode Super Minus                spawn 'pamixer -d 5'
    riverctl map $mode Super 0                    spawn 'pamixer --toggle-mute'

    # Control MPRIS aware media players with playerctl (https://github.com/altdesktop/playerctl)
    riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
    riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
    riverctl map $mode None XF86AudioNext  spawn 'playerctl next'

    # Control screen backlight brightness with light (https://github.com/haikarainen/light)
    riverctl map $mode None XF86MonBrightnessUp   spawn 'light -A 5'
    riverctl map $mode None XF86MonBrightnessDown spawn 'light -U 5'
done
