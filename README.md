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

Or even directly pull the image uploaded at: `docker.io/ketsapiwiq/yunodock`

And we have a beautiful Docker container and image!

**But!** post-install is still a bit tricky. Try this command then read the "Known bugs" section below:

`sudo podman exec -it yunodock yunohost tools postinstall`

## Known bugs
### Post-install
- To have a functional YunoHost, currently we need to **do the postinstall twice** (with two different domains and two different users) because yunohost firewall fails loudly first, and quietly the second time. You can check if the file `/etc/yunohost/installed` exists to see if it went well the second time, as it will still complain in the logs.

### Installing apps
- Installing apps will fail first if you choose the domain of the post-install, because that domain / nginx conf wasn't installed correctly, so you need to create a new domain first.

### Restarting services
- After the post-install, all services are in a failed state, manually restarting them fixes it though (except `yunohost-firewall`, that's expected).

## Podman rootless

It works (first check if Podman rootless works correctly by running a simple container), but you have no IP (this is normal), so you'll need to bind the 443 (and 80) ports of the container to one of yours, and if you can't bind to your host's port 443, add a reverse proxy to expose it.

`podman run -d -p 8000:80 -p 8443:443 docker.io/ketsapiwiq/yunodock`

## Docker

This should work in Docker with weird flags like `-v /sys/fs/cgroup:/sys/fs/cgroup`, however I couldn't run any systemd-enabled images on my Docker.

With `--privileged` it runs, but the postinstall broke my TTYs! So that's potentially dangerous.