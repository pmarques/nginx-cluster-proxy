PORT=${PORT:-8080}

cp /riak-cs.proxy.tmpl.conf /riak-cs.proxy.conf

for NAME_VARIABLE in $(env | sed -n 's/^\([^=]*I[a-zA-Z]*[0-9]\+_NAME\)=.*/\1/p'); do
  URL_VARIABLE="${NAME_VARIABLE%_NAME}_PORT_${PORT}_TCP"
  eval URL="\$$URL_VARIABLE"
  if [ "$URL" == "" ] ; then
    echo "Container linked '${NAME_VARIABLE%_NAME}' has no port '$PORT'"
    exit 1
  fi
  URL="${URL#tcp://}"
  sed -i '/upstream riak_cs_host {/a \ \ server '$URL';' /riak-cs.proxy.conf
done

mv /riak-cs.proxy.conf /etc/nginx.conf

# Run nginx!
nginx
