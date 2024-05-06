#!/bin/bash

sudo podman build -t yunodock:preinstall .
sudo podman run -d --name yunodock --replace yunodock:preinstall
sudo podman exec yunodock bash install.sh -a -f -d stable
sudo podman commit yunodock yunodock:installed
sudo podman tag yunodock:installed yunodock:latest

echo "Your YunoHost is at:"
echo $(sudo podman inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yunodock)

# sudo podman exec -it yunodock yunohost tools postinstall