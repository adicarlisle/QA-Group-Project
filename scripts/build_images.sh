#!/bin/bash

error()
{
    echo "[ERROR]:" "$1" "EXITING"1>&2
    exit 1
}

warning()
{
    echo "[WARNING]:" "$1" 1>&2
}

output()
{
    echo "[OUTPUT]:" "$1" 1>&2
}

output "Building the Petclinic FE"
cd ./AngularPet/; npm install; npm run-script build; cd ..

output "Building team_2_angularpet"
sudo docker build --no-cache -t acarli/team_2_angularpet ./AngularPet

if [[ "$(sudo docker images -q acarli/team_2_angularpet:latest 2> /dev/null)" == "" ]]; then
    error "could not rebuild image"
fi

output "Running maven clean install to rebuild the jar file"
cd ./JavaPet/; mvn clean install; cd ..

output "Building team_2_javapet"
sudo docker build --no-cache -t acarli/team_2_javapet ./JavaPet

if [[ "$(sudo docker images -q acarli/team_2_javapet 2> /dev/null)" == "" ]]; then
    error "could not rebuild image"
fi

output "Building nginx image"
sudo docker build --no-cache -t acarli/nginx ./nginx

if [[ "$(sudo docker images -q acarli/nginx:latest 2> /dev/null)" == "" ]]; then
    error "could not rebuild image"
fi