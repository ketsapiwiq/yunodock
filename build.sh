#!/bin/bash

sudo podman build -t yunodock .
sudo podman run -d --name yunodock --replace yunodock
sudo podman exec yunodock bash install.sh -a -f -d stable
sudo podman commit yunodock yunodock:installed

echo "Your YunoHost is at:"
echo $(sudo podman inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yunodock)

# sudo podman exec yunodock bash install.sh -a -f -d unstable