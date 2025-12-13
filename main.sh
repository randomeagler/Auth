#!/bin/bash
echo starting...
cd auth
java -Xms128M -Xmx510M -jar paper.jar & 
sleep 3m
zrok reserve private 0.0.0.0:25565 --backend-mode tcpTunnel --unique-name auth
