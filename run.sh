
sudo podman volume create --opt type=tmpfs --opt device=local --opt o=rw,exec tmp_ynh
sudo podman run -it --rm --name yunodock --net=host -h x250.home --cap-add=NET_ADMIN --mount 'type=volume,source=tmp_ynh,target=/tmp' yunodock

