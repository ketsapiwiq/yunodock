# YunoHost on Docker?!?

With Podman we have containers with working systemd.

So we can do:
```
sudo podman build -t yunodock:preinstall .
sudo podman run -d --name yunodock yunodock:preinstall
sudo podman exec yunodock:preinstall bash install.sh -a -f -d stable
sudo podman commit yunodock yunodock:installed
```

Or just run:
`bash build.sh`

And we have a beautiful Docker container and image!

**But!** Post-install still fails though.

You're welcome to try to run it in Podman unprivileged or in Docker with weird flags.