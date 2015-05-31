FROM org.tecris/jdk7

# inspired from
# https://github.com/oskapt/docker-openfire, and,
# https://github.com/mike-douglas/docker-openfire


ENV OPENFIRE_VERSION 3.9.3

RUN wget -O /tmp/openfire_${OPENFIRE_VERSION}_all.deb "http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}_all.deb"
# ADD openfire_${OPENFIRE_VERSION}_all.deb /tmp/openfire_${OPENFIRE_VERSION}_all.deb

RUN dpkg -i /tmp/openfire_${OPENFIRE_VERSION}_all.deb

EXPOSE 9090 9091 5222 5223 5269 9999

ENTRYPOINT ["java", "-server", "-DopenfireHome=/usr/share/openfire", "-Dopenfire.lib.dir=/usr/share/openfire/lib", "-classpath", "/usr/share/openfire/lib/startup.jar", "-jar", "/usr/share/openfire/lib/startup.jar"]
