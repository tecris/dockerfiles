FROM ubuntu/jdk7

# based on 
# https://github.com/oskapt/docker-openfire, and,
# https://github.com/mike-douglas/docker-openfire

RUN wget -O /tmp/openfire_3.9.3_all.deb "http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_3.9.3_all.deb"
# ADD openfire_3.9.3_all.deb /tmp/openfire_3.9.3_all.deb

RUN dpkg -i /tmp/openfire_3.9.3_all.deb

ADD openfire.supervisor.conf /etc/supervisor/conf.d/openfire.conf

EXPOSE 9090 9091 5222 5223 5269 9999
