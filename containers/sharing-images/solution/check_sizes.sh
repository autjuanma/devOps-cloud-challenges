#!/bin/bash

# Check archive and image sizes
du -sh httpd.tar
podman image ls | grep httpd