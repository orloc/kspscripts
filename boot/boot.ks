// General boot script
@LAZYGLOBAL off.
clearscreen.
print "Initializing...". wait 0.5.

local updatescript is "".

runoncepath("0:lib/files.ks").

set updatescript to ship:name:tolower:replace(" ", "_") + ".ks".

print "Trying to load : " + updatescript. 
if addons:rt:hasconnection(ship) { 
    if altitude < 10000 { // only when we are on the ground. 
        if hasfile(updatescript, 0) { 
            download(updatescript). 
            runoncepath("1:"+updatescript).
        }.
    }.
}.

print "Ship script not found nothing to do...".

