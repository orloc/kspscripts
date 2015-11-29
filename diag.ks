clearscreen.

getheading().

until ship:altitude > 150000 {
    refreshline(5,0, "Actual Dir: " + ship:facing ).
    refreshline(9,0, "R: " + body("Earth"):radius ).
    refreshline(10, 0, "Q: " + ship:q ).
    refreshline(11, 0, "Airspeed: " + ship:airspeed ).
    refreshline(12, 0, "Groundspeed: " + ship:groundspeed ).
    refreshline(13, 0, "Surface Speed: " + ship:velocity:surface:mag ).
    refreshline(14, 0, "Atm Eff: ?"  ).
    refreshline(15, 0, "Mass: " + ship:mass ).
    refreshline(16, 0, "Heading: " + ship:heading ).
    refreshline(17, 0, "Bearing: " + ship:bearing ).
    refreshline(18, 0, "Max Thrust: " + ship:maxthrust ).
    refreshline(19, 0, "Available Thrust: " + ship:availablethrust ).
    refreshline(20, 0, "Thrust w/ Q: " + ship:availablethrustat(ship:q) ).
}.
