#!/bin/env bash

xinput --set-prop 9 "libinput Scrolling Pixel Distance" 50 #slow down touchpad scrollng
xinput --set-prop 10 "libinput Scrolling Pixel Distance" 50 # slow down trackpoint scrolling

xinput --set-prop 9 "libinput Accel Profile Enabled" 0 1 0 # disable touchpad accel
#xinput --set-prop 10 "libinput Accel Profile Enabled" 0 1 0 # disable trackpoint accel


