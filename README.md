# docker-laravel-deploy

## Description

Deploying a Laravel and MySQL app using Docker.

The app is from my other [repository](https://github.com/fajrikornel/dummydashboard) on GitHub, which is a dashboard app that displays dummy live data.

There are three user-executable scripts as of now:

1. To build the Laravel image using docker build:

        cd laravel-container && ./build_laravel.sh: 

2. To run the app (laravel image must be built first)

        ./run_app.sh

3. To destroy the app cleanly (leaving no remaining container and volumes)

        ./destroy_app.sh:

## To do list:

Tidy up the environment variables and create a script to programatically modify the environment variables for the app (docker network, .env variables)