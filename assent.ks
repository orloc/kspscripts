@LAZYGLOBAL off.

global prev_thrust is 0.
global trotation is r(0,0,-90).

function adjust_pitch {
    parameter start_pitch,desired_pitch.
    
    local initial_heading is start_pitch.
    until false {
        if check_stage_fuel(stage:solidfuel) = true  {
            refreshline(0, 9, "Staging...").
            wait 0.5. stage. wait 1.
        }.
        set prev_thrust to maxthrust.
        if initial_heading = desired_pitch { break. }.
        set initial_heading to initial_heading - 0.5. lock steering to trotation + heading(90, initial_heading).
        refreshline(2, 0, "Target Heading: " + initial_heading).
        wait 0.2.
    }.
}.

function init_assent {
    parameter init_heading.
    set prev_thrust to ship:availablethrust. 
    SAS on. STAGE. wait 1.
    if (ship:availablethrust <= prev_thrust) { abort(). }. refreshline(0, 9, "Main engine ingintion.").
    wait 1. STAGE. wait 0.5.
    refreshline(0, 9, "Booster ingintion, Steering Engaged."). refreshline(2, 0, "Target Heading: " + init_heading).
    lock steering to trotation + heading(90, init_heading).
}.

function execute_profile {
    parameter initial_heading, profiles.

    local moves is profiles:length.
    from { local x is 0. } until x = moves step { set x to x + 3. } do {
        wait until altitude > profiles[x] and velocity:surface:mag > profiles[x+2]. refreshline(0, 9, "Starting Move " +  ((x / 3) + 1) + "/" + (moves / 3)).
        if x <> 0 { set initial_heading to profiles[x-2]. }.
        adjust_pitch(initial_heading, profiles[x+1]). refreshline(0, 9, "Move " +  ((x / 3) + 1) + "/" + (moves / 3)+ " complete.").
    }.
    
}.

function check_stage_fuel {
    parameter fuel.
    if fuel < 0.1 and maxthrust < prev_thrust - 10 {
        wait 1. return true.
    }. return false.
}.

function abort { 
    refreshline(0, 9, "Main engine FAILURE."). notify("Ending Program and shutting down in 2 seconds.").
    set thrott to 0. 
    wait 2. SHUTDOWN.
}.
