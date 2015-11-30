@LAZYGLOBAL off.
run termhelpers.
//parameter dir.
global current_thrust is maxthrust.
global last_alt is altitude.

stage. wait 2. toggle ag1. wait 0.5. toggle ag2. wait 0.5. toggle ag3. wait 0.5.
print "Systems Activated.".  print " ".

refreshline(0, 9, "Floating to Orbit Burn.").
RCS on. lock steering to r(0,0, -90) + heading(15, 0). wait until eta:apoapsis < 90.
refreshline(0, 9, "Starting burn").

lock throttle to 1. wait 2.
stage. wait 5. stage.

until false { 
    set last_alt to altitude.
    if (apoapsis - last_alt) > 50000 { //orbit is becoming eliptical
        print "ELIPTICAL ORBIT - halting engines.". lock throttle to 0. wait 0.5.
        wait until eta:apoapsis < 30. 
        wait 1. print "ELIPTICAL ORBIT - re-starting engines.". lock throttle to 1. wait 2.
        if (ship:availablethrust <= current_thrust) { abort("ELIPTICAL ORBIT - restart FAILED."). }. 
    }.
    if maxthrust < (current_thrust - 3) or maxthrust = 0 {
        stage. wait 1. 
    }.
    set current_thrust to maxthrust.
    if periapsis > 145000 { 
        refreshline(0, 9, "Orbit Reached"). lock throttle to 0. break. 
    }.
}.
