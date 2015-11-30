download("termhelpers.ks").
download("assent.ks").
run termhelpers.
run assent.

clearscreen.
print "Status: ".
refreshline(0, 9, "Prelaunch").
countdown().

// figure out how to make this list dynamically
set assent_profile to list (
// Altitude, Angle, Speed
0,85,90,
3000,80,90,
7500,75,300,
10000,70,400,
15000,65,500,
20000,60,500,
25000,55,500,
35000,45,900,
75000,0,900
).

init_assent(90).
execute_profile(90, assent_profile).
refreshline(0, 9, "Burning Additional Fuel").
until stage:number < 6 {
    if maxthrust = 0  { stage. wait 1. lock throttle to 0.}.
}.
refreshline(0, 9, "Loading Orbital Sequence").
wait 1.
local_remove("assent.ks").
download("circuralize_orbit.ks").
run circuralize_orbit.
