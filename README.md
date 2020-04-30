# docker-thunderbird

On remote machine - 

```
docker run \
  -it --rm \
  --name thunderbird \
  -v /home/$USER/.ssh/authorized_keys:/home/thunderbird/.ssh/authorized_keys:ro \
  -v /data/thunderbird:/home/thunderbird/.thunderbird \
  -p 49158:22 \
  riazarbi/thunderbird
```

Then, in a separate terminal - 

```
ssh -C -o StrictHostKeyChecking=no -o "UserKnownHostsFile /dev/null" -X thunderbird@server -p 49158 thunderbird
```


