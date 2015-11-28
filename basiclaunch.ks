run launch_helpers.

clearscreen.

global thrott is 1.
global base_height is 5000.

getheading().
print "Status: " at (0,4).
print "R: " + body("Earth"):radius at (0,9).
print "Q: " + ship:q at (0,10).
print "Initializing Launch Sequence..." at(9,4).
print " " at (0,5).

_sysTest().

refreshline(4, 9, "Systems Check Pass...").


_countdown().

init_launch().

wait until ship:velocity:surface:mag > 85.

refreshline(4, 9, "Initiating Role Program.").
RCS on. 
lock steering to r(0,0,-90) + heading(90, 83).
RCS off.

when ship:altitude > base_height then {
    when ship:altitude > base_height * 2.5 then {
        when ship:altitude > base_height * 5 then {
            when ship:altitude > base_height * 7.5 then {
                when ship:altitude > base_height * 10 then {
                }
            }
        }
    }
}

until ship:altitude > 150000 {
    print "Q: " + ship:q at (0,10).
}.


function init_launch {
    SAS on.
    lock throttle to thrott.
    stage.
    refreshline(4, 9, "Main Engine Ignition.").
    wait 1.0.
    lock steering to r(0,0,-90) + heading(90,90).
    stage.
    refreshline(4, 9, "Booster Ignition").
}.
