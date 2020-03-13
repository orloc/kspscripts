function notify {
    parameter message.
    hudtext(message, 5, 2, 50, white, false).
}.

function countdown {
    parameter param.
    from { local x is param . } until x = 0 step { set x to x - 1. } do { 
        rline(3,0,"Launch in T-" + x ). 
        wait 1.
    }. 
}.

function rline {
    parameter line, offset, content.
    local clearstring is " ". local targetlength is terminal:width - offset.
    from { local slength is 1. } until slength = targetlength step { set slength to slength + 1. } do { 
        set clearstring to clearstring + " ".
    }. 
    PRINT clearstring at (offset, line). 
    PRINT content at (offset, line).
}.
