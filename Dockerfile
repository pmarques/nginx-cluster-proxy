# FROM dockerfile/nginx
FROM nginx

MAINTAINER patrickmarques@baboom.com

RUN rm -f /etc/nginx/sites-enabled/default
ADD start.sh /start.sh
# ADD riak-cs.proxy.tmpl.conf /riak-cs.proxy.tmpl.conf
ADD riak-cs.proxy.tmpl.conf /riak-cs.proxy.tmpl.conf

VOLUME ["/var/log/nginx/"]

CMD ["/bin/bash", "/start.sh"]
