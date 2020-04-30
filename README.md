# docker-thunderbird

    docker pull riazarbi/thunderbird:latest
    docker run -d \
      --net host \
      --name thunderbird \
      -e DISPLAY \
      -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
      -u thunderbird \
      -v thunderbird_config:/home/thunderbird/.thunderbird/ \
      -v $HOME/Downloads:/home/thunderbird/Downloads \
      -v /etc/localtime:/etc/localtime \
      riazarbi/thunderbird thunderbird
      
      docker run \
    -d \
        --name thunderbird \
    -v $HOME/.ssh/authorized_keys:/authorized_keys:ro \
    -p 49158:22 \
    -v ~/appdata/thunderbird:/home/docker/.thunderbird/ \
    ironicbadger/docker-thunderbird
