download("termhelpers.ks"). download("assent.ks"). run termhelpers. run assent.
clearscreen. print "Status: ". rline(0, 9, "Prelaunch"). countdown(5).
set ap to list (
// Altitude, Angle, Speed
0,85,90,
3000,85,90,
5000,80,90,
7500,75,300,
10000,70,400,
14000,68,450,
15000,65,500,
20000,60,500,
25000,55,700,
35000,45,900,
75000,3,900
).
init_assent(90, 180). execute_profile(90, 180, ap). rline(0, 9, "Burning Additional Fuel").
until stage:number < 8 {
    if maxthrust = 0  { print "Staging Main Engine". wait 0.5. stage. wait 1. lock throttle to 0. }. wait 1.
}. rline(0, 9, "Loading Orbital Sequence"). wait 1. local_remove("assent.ks"). download("_orbit.ks"). run _orbit(189).
