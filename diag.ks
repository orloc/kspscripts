clearscreen.

getheading().

until ship:altitude > 150000 {
    rline(5,0, "Actual Dir: " + ship:facing ).
    rline(9,0, "R: " + body("Earth"):radius ).
    rline(10, 0, "Q: " + ship:q ).
    rline(11, 0, "Airspeed: " + ship:airspeed ).
    rline(12, 0, "Groundspeed: " + ship:groundspeed ).
    rline(13, 0, "Surface Speed: " + ship:velocity:surface:mag ).
    rline(14, 0, "Atm Eff: ?"  ).
    rline(15, 0, "Mass: " + ship:mass ).
    rline(16, 0, "Heading: " + ship:heading ).
    rline(17, 0, "Bearing: " + ship:bearing ).
    rline(18, 0, "Max Thrust: " + ship:maxthrust ).
    rline(19, 0, "Available Thrust: " + ship:availablethrust ).
    rline(20, 0, "Thrust w/ Q: " + ship:availablethrustat(ship:q) ).
}.
