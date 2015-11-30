// General boot script
@LAZYGLOBAL off.
clearscreen.
global updatescript is "".
function hasfile { 
    parameter name, vol. 
    local allfiles is list(). switch to vol. list files in allfiles.
    for file in allfiles {if file:name = name { switch to 1. return true.}.}. switch to 1. return false.
}.
function upload { 
    parameter name. 
    if hasfile(name, 1) { if hasfile(name, 0) { switch to 0. delete name. switch to 1. }. COPY name to 0. return true.}. return false.
}.
function download {
    parameter name.
    if hasfile(name, 0) {
        if hasfile(name, 1) { DELETE name from 1.}. COPY name from 0. return true.
    }. return false.
}.
function local_remove {
    parameter name.
    if hasfile(name, 1) { delete name. }.
}.
clearscreen. print "Waiting a few moments before initialization". wait 2.
set updatescript to ship:name:tolower:replace(" ", "_") + ".ks".
print "Trying to load : " + updatescript. wait 1.
if addons:rt:hasconnection(ship) { 
    if hasfile(updatescript, 0) { 
        download(updatescript). print "File Downloaded". wait 0.5. if hasfile("update.ks", 1) { delete update.ks. }. rename updatescript to "update.ks". run update.ks. delete update.ks. print "File Loaded". wait 0.5.
    }.
}.
clearscreen. print "ERROR - falling back". wait 0.5.
if hasfile("startup.ks", 0) { 
    download("startup.ks"). print "Startup Found and loaded". wait 0.5. run startup.ks.
} else { 
    print "FATAL - no program found". wait until addons:rt:hasconnection(ship). wait 10. reboot.
}.
