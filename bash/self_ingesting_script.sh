#!/bin/bash 

# Self-ingesting script
# From https://superuser.com/a/440059
#
# This allows text bloxks within the script to be used like files
# This works well for avoiding quotation and escape character hell


# The <( begins a process substitution. It's valid to use with -f because what gets 
# substituted is a file descriptor like /dev/fd/5 
# Notice the use of brackets. That prevents the following line from matching itself. 
cat <(sed -e '/[B]EGIN_AWK1/,/[E]ND_AWK1/!d' $0)

# Do other stuff here

exit  ## Execution stops here. The rest is consumed by subprocesses of this script! 

#BEGIN_AWK1 
    BEGIN{ 
        printf("%s:%s:%s:%s:%s:%s:%s\n", "index", "total", "used", "free", "cached", "buffers", "cache") 
    } 
    /^#/{ 
        gsub("#", "") 
        printf("%d:", $0+1) 
    } 
    /^M/{ 
        printf("%d:%d:%d:%d:", $2,$3,$4,$7) 
    } 
    /^-/{ 
        printf("%d:%d\n", $3, $4) 
    } 
#END_AWK1