clearscreen.
print "Startup loaded".

lock throttle to 0.

if altitude > 130000 { 
    SAS on.
    // turn off our engines
    list engines in sEng.
    for eng in sEng { 
        if eng:allowshutdown {
            eng:shutdown(). 
            print "Disabling Engines". wait 1. 
        }.
    }.
    until false {
        RCS on. print "Adjusting control.".
        lock throttle to 0.5.
        lock steering to heading(90,90) + r(0,0,0). 
        wait 20.
        lock throttle to 0.
        RCS off.
        wait 60.
    }.
    // check energy and rotation to the sun
}.
