const ScriptServer = require('scriptserver');

const server = new ScriptServer({
  core: {
    jar: 'paper.jar', // Name of your server JAR file
    args: ['-Xmx500M', '-Xms500M'], // Arguments for RAM usage
    rcon: {
      port: '25575',
      password: 'root'
    }
  }
});

server.start();
console.log('Minecraft server starting...');

// Example of sending a command after server starts (requires rcon setup)
server.on('started', () => {
  server.send('say Node.js server is now running!');
});
