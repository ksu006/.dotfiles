#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set general.dont_remap_apple_pointing 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.pointing_button4_to_command_bracket_left 1
/bin/echo -n .
$cli set remap.pointing_button5_to_command_bracket_right 1
/bin/echo -n .
$cli set remap.reverse_vertical_scrolling 1
/bin/echo -n .
$cli set remap.shiftDelete2forwarddelete 1
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
/bin/echo
