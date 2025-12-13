FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y openjdk-17-jre-headless wget curl 
RUN curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
RUN echo "deb https://ngrok-agent.s3.amazonaws.com bookworm main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list
RUN sudo apt update
RUN sudo apt install ngrok
RUN ngrok config add-authtoken 36mEaN170pNDocM0NO28JkeJJqp_2w7jzkXSKwQvn7pFZBsJ4
RUN ngrok tcp 25565


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
