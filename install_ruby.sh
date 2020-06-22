#!/bin/bash

apt update

apt install -y ruby-full ruby-bundler build-essential

# Check for errors

if test $? -ne 0
then
     echo "Exit code: '$?'. Please review log and fix errors manually!"
else
     echo "Ruby, bundler and build essential installed succesfully. YAHOO."
fi
