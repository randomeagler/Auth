#!/bin/bash
echo starting...
cd auth
ssh -p 443 -R0:127.0.0.1:25565 tcp@free.pinggy.io
java -Xms128M -Xmx510M -jar paper.jar 

