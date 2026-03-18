#Uses Alpine Linux as the base image. I chose Alpine because it is lightweight and sufficient for a simple shell-based container.
FROM alpine:3.19 

#Sets /app as the working directory inside the container. This keeps the container structure organized.
WORKDIR /app

#Copies the script from the local project directory into the container image.
COPY entrypoint.sh /app/entrypoint.sh

#Makes the script executable so it can be run as the container entrypoint.
RUN chmod +x /app/entrypoint.sh

#Defines the executable that runs when the container starts.
ENTRYPOINT ["/app/entrypoint.sh"]
