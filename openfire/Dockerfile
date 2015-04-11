FROM org.tecris.ubuntu1404.util/jdk7

# inspired from
# https://github.com/oskapt/docker-openfire, and,
# https://github.com/mike-douglas/docker-openfire


ENV OPENFIRE_VERSION 3.9.3

RUN wget -O /tmp/openfire_${OPENFIRE_VERSION}_all.deb "http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}_all.deb"
# ADD openfire_${OPENFIRE_VERSION}_all.deb /tmp/openfire_${OPENFIRE_VERSION}_all.deb

RUN dpkg -i /tmp/openfire_${OPENFIRE_VERSION}_all.deb

ADD openfire.supervisor.conf /etc/supervisor/conf.d/openfire.conf

EXPOSE 9090 9091 5222 5223 5269 9999
