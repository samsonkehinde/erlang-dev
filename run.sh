#!/bin/sh -e
NAME=${NAME:-"erlang-dev"}

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
	echo "stopping: "
	docker stop -t 1 $NAME
	echo "removing: "
	docker rm -f $NAME
fi

echo "starting: $NAME "
docker run -itd -v $(pwd)/scripts:/scripts -p 7000:7000 -h $NAME -w /scripts --name $NAME --expose 7000 kehindesamson/kazoo:erlang

#docker exec -i $NAME "sh /home/user/erlang/activate"
docker attach $NAME
