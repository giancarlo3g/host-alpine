# Use the official Alpine base image
FROM alpine:latest

# Set a working directory
WORKDIR /app

RUN apk add --no-cache bash iproute2 iputils dhclient

# Copy a script into the image and make it executable
COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh

ENTRYPOINT ["/app/script.sh"]

# Use a background process (to keep the container running)
CMD []