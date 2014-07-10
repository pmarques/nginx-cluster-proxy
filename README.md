# Nginx Proxy
## Build
```bash
docker build -t nginx-cluster-proxy .
```

## Run
```bash
docker run \
  --link riak-cs01:i1
  --link riak-cs02:i2
  --link riak-cs03:i3
  --link riak-cs04:i4
  --link riak-cs05:i5
  -d -p 80:80 -p 443:443
  --name riak-proxy nginx-cluster-proxy
```
