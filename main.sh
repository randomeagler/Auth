#!/bin/bash
echo starting...
cd auth
zrok reserve private 0.0.0.0:25565 --backend-mode tcpTunnel --unique-name auth
