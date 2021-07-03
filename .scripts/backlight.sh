#!/bin/sh

VALUE="$(cat /sys/class/backlight/amdgpu_bl0/brightness)"

if brightnessup then
    sudo echo $((VALUE + 5)) > /sys/class/backlight/amdgpu_bl0/brightness
elif brightnessdown then
    sudo echo $((VALUE - 5)) > /sys/class/backlight/amdgpu_bl0/brightness