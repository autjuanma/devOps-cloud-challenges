## solution [JuanTM]
## First, let's pull the nginx:alpine image if you don't have it locally:


podman pull nginx:alpine

* Now, let's run a container using this image:

podman run -d --name nginx_container -p 80:80 nginx:alpine


## Objective 2: Verify the web server runs and is accessible

podman ps

and open http://localhost:80 in your web browser.


Let's create an HTML file named index.html with the specified content:

echo "<html><head><title>It's a me</title></head><body><h1>Juansito</h1></body></html>" > index.html

## Now, let's copy this file to the container:

podman cp index.html nginx_container:/usr/share/nginx/html/index.html

Objective 4: Create an image out of the running container

podman commit nginx_container nginx_Juansito


## Objective 5: Tag the container with "Juansito" tag

* Let's tag the nginx_Juansito image with the Juansito tag:

podman tag nginx_Juansito nginx_Juansito:Juansito

## Objective 6: Remove the original container

Let's remove the original container:


## Objective 7: Create a new container out of the image

Let's create a new container from the nginx_Juansito image:

podman run -d --name nginx_container_new -p 80:80 nginx_Juansito:Juansito

This command creates a new container named nginx_container_new from the nginx_Juansito:Juansito image, and binds port 80 of the container to port 80 on the local machine.


## Objective 8: Run curl 127.0.0.1:80

curl 127.0.0.1:80

## Objective 9: Run podman diff on the new image

Let's run podman diff on the new image:
podman diff nginx_Juansito:Juansito

The output will show you the differences between the original nginx:alpine image and the new nginx_Juansito:Juansito image. The main difference should be the addition of the index.html file in the /usr/share/nginx/html directory.




