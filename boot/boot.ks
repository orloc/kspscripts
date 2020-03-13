// General boot script
@LAZYGLOBAL off.

runoncepath("0:lib/files.ks").

clearscreen.
global updatescript is "".

print "Initializing...". wait 1.

set updatescript to ship:name:tolower:replace(" ", "_") + ".ks".

print "Trying to load : " + updatescript. 
if addons:rt:hasconnection(ship) { 
    if altitude < 10000 { // only when we are on the ground. 
        if hasfile(updatescript, 0) { 
            download(updatescript). print "File Downloaded". 
            local_remove("update.ks").
            rename updatescript to "update.ks". 
            run update.ks. 
            delete update.ks. 
            print "File Loaded". 
        }     
    }.
} 

clearscreen. print "Ship script not found - falling back". wait 0.5.
if hasfile("lib/startup.ks", 0) { 
    download("startup.ks"). 
    print "Startup Found and loaded". 
    startup_fallback().
} else { 
    print "FATAL - no program found". 
    wait until addons:rt:hasconnection(ship). wait 10. reboot.
}.

