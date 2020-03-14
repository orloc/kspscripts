clearscreen. 
download("lib/terminal.ks"). 
download("lib/assent.ks"). 

runoncepath("terminal.ks").
runoncepath("assent.ks").
 
clearscreen.

set ap to list (
// Altitude, Angle, Speed
0,98,30,
0,97,70,
1200,96,120,
5000,94,300,
9000,90,0,
10000,85,0,
15000, 75,0
).

countdown(10).


init_assent(90, 180). 
execute_profile(90, 180, ap). 
rline(0, 9, "Done with assent."). 
