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
    OPTIND=2
    while getopts ":d" opt; do
        case $opt in
            d)
                export FLASK_ENV=developement;
                export FLASK_DEBUG=1;
                echo ">>> DEVELOPMENT MODE ACTIVATED";
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2;
                ;;
            :)
        esac
    done
    if [ $OPTIND -eq 2 ]
    then
        echo "Hint: Use 'run -d' for debug mode";
    fi
    export FLASK_APP=app.py;
    pipenv run flask run;
else
    echo "Invalid command"
fi


