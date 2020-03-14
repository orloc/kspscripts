function hasfile { 
    parameter name, vol. 
    local allfiles is list().
    print allfiles.
    switch to vol. 
    list files in allfiles.
    for file in allfiles {
        if file:name = name { 
            switch to 1. return true.
        }.
    }. 
    switch to 1. 
    return false.
}.

function upload { 
    parameter name. 
    if hasfile(name, 1) { 
        if hasfile(name, 0) { 
            switch to 0. 
            delete name. 
            switch to 1. 
        }. 
        COPY name to 0. return true.
    }. 
    return false.
}.

function download {
    parameter name.
    local split is name:split("/").
    COPYPATH("0:/" +  name, split[split:length-1]). 
    print "File Downloaded: " + name. 
    return true.
}.

function local_remove {
    parameter name.
    if hasfile(name, 1) { 
        delete name. 
    }.
}.
