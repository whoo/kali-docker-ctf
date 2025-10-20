#!/bin/bash


# To build container
[ $# -gt 0 ] && docker build -t ihack .

P="$HOME/docker-home-kali"


function create() {
docker run -d --name ihack  --hostname igloo -v $P:/home/kali -p 8888:8888 -p10022:22 ihack tail -f /dev/null
}

docker ps | grep ihack > /dev/null
if [ $? != 0 ]
then
echo "[32;2mStart Ihack[0m"
docker start ihack
[ $? == 1 ] && create
fi

# Connexion à un shell 
docker exec -it ihack login -f kali
