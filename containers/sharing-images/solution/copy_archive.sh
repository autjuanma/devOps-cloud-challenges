#!/bin/bash

# Copy the archive to a remote host
rsync -azc httpd.tar USER@REMOTE_HOST_FQDN:/tmp/


# Replace USER with your remote host username and REMOTE_HOST_FQDN