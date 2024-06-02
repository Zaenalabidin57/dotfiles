#!/bin/bash

exitfn () {
    trap SIGINT              # Restore signal handling for SIGINT
    echo; echo 'Aarghh!!'    # Growl at user,
    exit                     #   then exit script.
}

trap "exitfn" INT            # Set up SIGINT trap to call function.

read -p "What? "             # Ask user for input.
echo "You said: $REPLY"

trap SIGINT
