## solution [JuanTM]
## Objective 1: Run a container with a database (MySql)


1. First, let's pull the mysql image from Docker Hub if it doesn't exist locally:

[docker pull mysql]


Now, let's run a container using this image and mount a host directory as a volume for the database:

docker run -d --name mysql_container -v /home/user/mysql-data:/var/lib/mysql -p 3306:3306 mysql

This command runs the container in detached mode (-d), names it mysql_container, mounts the host directory /home/user/mysql-data to the container directory /var/lib/mysql, and binds port 3306 of the container to port 3306 on the local machine (-p 3306:3306).


<!-- [JuanTM] Argument -->
Why use host storage instead of container storage?

Using the host storage instead of the container storage is a better choice for several reasons:

Persistence: When you use a container's storage, the data is lost when the container is removed or restarted. By using a host directory as a volume, the data is persisted even if the container is removed or restarted.
Performance: Host storage is typically faster and more reliable than container storage.
Scalability: If you need to scale your database, using host storage makes it easier to move the data to a different container or host.




## verify that the database is running by connecting to it using a MySQL client:
[mysql -h 127.0.0.1 -u root -p<password>]

## container was created but actually the status is "Exited (1) 2 minutes ago"

<!-- [JuanTM] -->
Let's troubleshoot this issue
docker stop mysql_container
docker rm mysql_container

Now, let's run the container again with the --rm flag set to false:

[docker run -d --name mysql_container --rm=false -v /home/[JuanTM]/docker-test/mysql-data:/var/lib/mysql -p 3306:3306 mysql]


## Next, let's check the container's logs to see what error message was generated:

docker logs mysql_container




