#!/bin/bash

if [ $1 = "setup" ]
then
    pip install pipenv;
    pipenv install --ignore-pipfile;
elif [ $1 = "lint" ]
then
    black .;
elif [ $1 = "test" ]
then
    echo "test"
elif [ $1 = "run" ]
then
    echo "run"
else
    echo "Invalid command"
fi


