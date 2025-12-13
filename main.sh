#!/bin/bash
echo starting...
cd auth
java -Xms128M -Xmx510M -jar paper.jar &
ssh -p 443 -R0:127.0.0.1:25565 tcp@free.pinggy.io
