Application Overview

The application consists of the following services:

Web Server (NGINX): serves static content and acts as a reverse proxy
API Server (Node.js): handles API requests and interacts with the database
Database (PostgreSQL): stores application data
Message Queue (RabbitMQ): handles message queuing for asynchronous tasks
Worker (Python): consumes messages from the message queue and performs tasks

Challenge Steps

Create a Docker Compose file (docker-compose.yml) that defines all services and their dependencies.
Configure service scalability using Docker Compose's built-in scaling features.
Implement monitoring using Prometheus and Grafana:
Create a Prometheus configuration file (prometheus.yml) to scrape metrics from each service.
Create a Grafana dashboard to visualize metrics.
Optimize resource allocation for each service using Docker Compose's resource management features.
Implement secure communication between services using SSL/TLS certificates.
Set up centralized logging using ELK Stack:
Create a Logstash configuration file (logstash.conf) to collect logs from each service.
Create an Elasticsearch index pattern to store logs.
Create a Kibana dashboard to visualize logs.
Test and validate the setup by deploying the application and verifying that all services are working as expected.