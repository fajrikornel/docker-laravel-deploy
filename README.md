# docker-laravel-deploy

## Description

Deploying a Laravel and MySQL app using Docker.

The app is from my other [repository](https://github.com/fajrikornel/dummydashboard) on GitHub, which is a dashboard app that displays dummy live data.

There are four user-executable scripts:

1. To build the Laravel image using docker build. This is mandatory.

        ./build_app.sh

2. To configure the app (customize environment according to user input). This is also mandatory in order to run the app.

        ./config_app.sh

3. To run the app (steps 1 and two must already be run).

        ./run_app.sh

4. To destroy the app cleanly (leaving no remaining container and volumes).

        ./destroy_app.sh:

## Repo structure

| Folder | Description |
| ------ | ----------- |
| /      | Contains the automation script for building, configuring, running, and destroying the app |
| /laravel-container | Contains the files necessary to build the Laravel app image and run the container, including environment variables |
| /mysql-container | Contains the files necessary to run the MySQL container, including the schema and environment variables |