@LAZYGLOBAL off.

global prev_thrust is 0.

function pitch_craft {
    parameter 
        start_pitch,
        desired_pitch.

    local initial_heading is start_pitch.

    until false {
        if initial_heading = desired_pitch {
            break.
        }

        set initial_heading to initial_heading - 1.

        lock steering to heading(90, initial_heading).
        wait 1.
    }.
}.

function init_assent {
    set prev_thrust to ship:availablethrust.
    SAS on. 
    STAGE. 
    wait 1.

    if (ship:availablethrust <= prev_thrust) {
        abort().
    }.

    refreshline(4, 9, "Main engine ingintion.").

    wait 1. STAGE. wait 0.5.

    lock steering to r(0,0,-90) + heading(90,90).
    refreshline(4, 9, "Booster ingintion, Steering Engaged.").

    when check_stage_fuel(stage:solidfuel) = true then {
        stage.
    }.
}.

function check_stage_fuel {
    parameter fuel.

    if fuel < 0.1 and maxthrust < prev_thrust - 10 {
        wait 1.
        return true.
    }.

    return false.
}.

function abort { 
    refreshline(4, 9, "Main engine FAILURE.").
    notify("Ending Program and shutting down in 2 seconds.").
    set thrott to 0.
    wait 2.
    SHUTDOWN.
}.
