FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y openjdk-17-jre-headless wget curl
RUN apt-get install gnupg -y
RUN curl -sSLf https://get.openziti.io/install.bash | bash -s zrok
RUN apt install zrok-agent
RUN zrok enable ADfolPa4LnuI --headless


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
RUN java -Xms128M -Xmx510M -jar /app/auth/paper.jar

# Run the startup script
CMD ["./main.sh"]
