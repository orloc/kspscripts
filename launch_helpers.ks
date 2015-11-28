@LAZYGLOBAL off.

function _countdown {
    from { local x is 10. } until x = 0 step { set x to x - 1. } do {
        refreshline(6,0,"Launch in T-" + x ).
        wait 0.5.
    }.
    refreshline(6,0," ").
}.

function _getengines {
    local my_engines is list().
    list engines in my_engines.
    return my_engines.
}.

function _buildTree { 
    local rootPart is ship:rootpart.
    local partTree is list().

}.

function _sysTest {
    SAS on.
    wait 0.5.
    SAS off.
    wait 0.5.
    RCS on. 
    wait 0.5.
    RCS off.
    wait 0.5.
}.

function getheading {
    print "=======" at (0,0).
    print "= OFD =" at (0, 1).
    print "=======" at (0, 2).
    print " " at (0, 3).
}.

function refreshline {
    parameter 
        line,
        offset,
        content.
    
    local clearstring is " ".
    local targetlength is terminal:width - offset.

    from { local slength is 1. } until slength = targetlength step { set slength to slength + 1. } do { 
        set clearstring to clearstring + " ".
    }.

    print clearstring at (offset, line).
    print content at (offset, line).
}.
