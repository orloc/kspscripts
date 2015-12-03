@LAZYGLOBAL off.
run termhelpers.
parameter dir.
global current_thrust is maxthrust.
global last_alt is altitude.

clearscreen.

rline(0, 9, "Activating Systems").
stage. wait 2. toggle ag1. wait 0.5. toggle ag2. wait 0.5. toggle ag3. wait 0.5.

rline(0, 9, "Floating to Orbit Burn.").
RCS on. lock steering to r(0,0, -90) + heading(dir, 0). wait until eta:apoapsis < 90.
rline(0, 9, "Starting burn").

lock throttle to 1. wait 2.
stage. wait 5. stage.
rline(0, 9, "Ignition Complete").

until false { 
    if maxthrust < (current_thrust - 5) or current_thrust = 0 { 
        stage. wait 2.
        set current_thrust to maxthrust. 
    }.
    set current_thrust to maxthrust.
    if (apoapsis - last_alt) > 10000 and velocity:surface:mag > 6000 { print "ELIPTICAL ORBIT at" + apoapsis. }.
    set last_alt to altitude.
    if periapsis > 145000 { 
        rline(0, 9, "Orbit Reached"). lock throttle to 0. break. 
        print "Complete. Shutting down". wait 5. 
    }.
}.
