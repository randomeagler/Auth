FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y openjdk-17-jre-headless wget curl
RUN curl -sSLf https://get.openziti.io/install.bash | bash -s zrok
RUN apt install zrok-agent
RUN zrok enable Ftp2rbg2vota
RUN zrok reserve private 0.0.0.0:25565 --backend-mode tcpTunnel --unique-name auth


# Set working directory
WORKDIR /app

# Copy your BungeeCord files
COPY auth /app/auth

# Copy your startup script
COPY main.sh /app/main.sh
RUN chmod +x /app/main.sh
RUN chmod +x /app/auth

# Expose the BungeeCord port
EXPOSE 25565

# Run the startup script
CMD ["./main.sh"]
