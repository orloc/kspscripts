@LAZYGLOBAL off.
run termhelpers.

global current_thrust is maxthrust.
global last_alt is altitude.

refreshline(0, 9, "Floating to Orbit Burn.").

RCS on.
lock steering to r(0,0, -90) + prograde.
wait until eta:apoapsis < 120 or last_alt > altitude.
refreshline(0, 9, "Starting burn").

lock throttle to 1.

when stage:solidfuel < 0.1 and maxthrust < (current_thrust - 10) then {
    refreshline(0, 9, "Stagging...").
    stage. 
}.

until false { 
    refreshline(5, 0, "Diff : " + abs(periapsis - apoapsis)).

    if stage:liquidfuel < 0.1 and maxthrust < (current_thrust - 10) or maxthrust = 0  {
        wait 1. stage. wait 1. 
        set current_thrust to maxthrust.
    }.

    if periapsis > 165000 { 
        break.
    }.
}.
