global pthrust is 0.
global trotation is r(0,0,0).

function adjust_pitch {
    parameter sp,dp, dir.
    local ih is sp.
    until false {
        if check_stage_fuel(stage:solidfuel) = true  { 
            print "Staging...". 
            wait 0.5. 
            stage. 
            wait 1. 
        }.
        set pthrust to maxthrust. 
        if ih = dp { break. }.
        set ih to ih - 0.5. 
        lock steering to trotation + heading(dir, ih).
        update_diag(ih).
    }.
}.

function update_diag { 
        parameter th.
        rline(15, terminal:width - 25, "Target Heading: " + th). 
        rline(16, terminal:width - 25, "Current Q: " + round(ship:q,4)). 
}.

function init_assent {
    parameter init_heading, dir.
    set pthrust to ship:availablethrust. 
    SAS on. 
    lock throttle to 1.
    wait 1.
    STAGE. 
    wait 1.
    if (ship:availablethrust <= pthrust) { 
        abort("Main engine FAILURE."). 
    }. 
    rline(0, 9, "Main engine ingintion."). 
    STAGE. 
    update_diag(init_heading).
}.

function execute_profile {
    parameter ih, dir, profs.
    local moves is profs:length.
    from { local x is 0. } until x = moves step { set x to x + 3. } do {
        wait until altitude > profs[x] and velocity:surface:mag > profs[x+2]. 

        rline(0, 9, "Starting Move " +  ((x / 3) + 1) + "/" + (moves / 3)).
        if x <> 0 { 
            set ih to profs[x-2]. 
        }. 

        adjust_pitch(ih, profs[x+1], dir). 
        rline(0, 9, "Move " +  ((x / 3) + 1) + "/" + (moves / 3)+ " complete.").
    }.
}.

function check_stage_fuel {
    parameter fuel.
    if fuel < 0.1 and maxthrust < pthrust - 10 { 
        wait 1. 
        return true.
    }. 
    return false.
}.

function abort { 
    parameter message.
    rline(0, 9, message). 
    notify("Ending Program and shutting down in 2 seconds."). 
    set thrott to 0. 
    wait 2. 
    SHUTDOWN.
}.
