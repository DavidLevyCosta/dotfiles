#!/usr/bin/env sh

# set variables
ScrDir="$(dirname "$(realpath "$0")")"
source "$ScrDir/globalcontrol.sh"
scol="${XDG_CONFIG_HOME:-$HOME/.config}/spicetify/Themes/Dribbblish/color.ini"
dcol="${XDG_CONFIG_HOME:-$HOME/.config}/spicetify/Themes/Dribbblish/Wall-Dcol.ini"

# regen conf
if pkg_installed spotify && pkg_installed spicetify-cli ; then

    if [ ! -w /opt/spotify ] || [ ! -w /opt/spotify/Apps ]; then
        notify-send -a "Hyprdots" "Permission needed for Wallbash Spotify theme"
        pkexec chmod a+wr /opt/spotify
        pkexec chmod a+wr /opt/spotify/Apps -R
    fi

    if [ "$(spicetify config | awk '{if ($1=="color_scheme") print $2}')" != "Wallbash" ] ; then
        spicetify &> /dev/null
        mkdir -p ~/.config/spotify
        touch ~/.config/spotify/prefs
        sptfyConf=$(spicetify -c)
        sed -i "/^prefs_path/ s+=.*$+= $HOME/.config/spotify/prefs+g" "${sptfyConf}"
        
        # optional: if Dribbblish theme is not yet installed, clone it or extract it here

        spicetify restore backup apply
        spicetify config current_theme Dribbblish
        spicetify config color_scheme Wallbash
        spicetify apply
    fi

    # kill spotify if it's running, apply, then relaunch
    if pgrep -x spotify > /dev/null ; then
        pkill -x spotify
        sleep 1
    fi

    # apply new color file
    cp "$dcol" "$scol"

    spicetify apply
    spotify & disown
fi

