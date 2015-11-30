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
12000,68,400,
15000,65,500,
20000,60,500,
24000,45,900,
65000,10,900
70000,5,900
75000,0,900
).

init_assent(90).
execute_profile(90, assent_profile).
