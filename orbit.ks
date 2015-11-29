@LAZYGLOBAL off.

function orbital_burn { 
    refreshline(4, 9, "Floating to Orbit Burn.").
    lock steering to heading(90,0).
    wait until eta:apoapsis < 120.

    lock throttle to 1.

    when stage:solidfuel < 0.1 and maxthrust < (current_thrust - 10) then {
        stage. 
    }.

    until false { 
        refreshline(5, 0, "Diff : " + abs(periapsis - apoapsis)).

        if stage:liquidfuel < 0.1 and maxthrust < (current_thrust - 10)  {
            wait 1. stage. wait 1. 
            set current_thrust to maxthrust.
        }.

        if periapsis > 165000 { 
            break.
        }.
    }.
}.
