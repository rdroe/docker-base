# Copy this file to the parent directory.

# arg 1: directory
# arg 2: port
# arg 3 (optional): additional port

echo "$# arguments supplied"

if [ $# -eq 3 ]
   then

       docker run -w /home/root/$1 -it -v /Users/davoroe/sites/$1:/home/root/$1 --publish $2:$2 --publish $3:$3 base:latest /bin/bash

fi

if [ $# -eq 2 ] 
   then
       docker run -w /home/root/$1 -it -v /Users/davoroe/sites/$1:/home/root/$1 --publish $2:$2 base:latest /bin/bash
fi
