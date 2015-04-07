FROM ubuntu/jdk7

# based on 
# https://github.com/oskapt/docker-openfire, and,
# https://github.com/mike-douglas/docker-openfire

# RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise main restricted universe" > /etc/apt/sources.list && apt-get -qq update
# RUN apt-get install -qq python-software-properties supervisor openjdk-7-jre-headless default-jre sudo

RUN wget -O openfire_3.9.3_all.deb "http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_3.9.3_all.deb"
# ADD openfire_3.9.3_all.deb /tmp/openfire_3.9.3_all.deb
RUN dpkg -i openfire_3.9.3_all.deb

# RUN chown -R openfire:openfire /etc/openfire /var/lib/openfire


# ADD docker.conf /etc/supervisor/conf.d/
# ADD start /start
# RUN chmod 755 /start

EXPOSE 9090 9091 5222 5223 5269 9999

RUN echo '' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo '[program:openfire]' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'command=sudo -u openfire -H java -server -DopenfireHome=/usr/share/openfire -Dopenfire.lib.dir=/usr/share/openfire/lib -classpath /usr/share/openfire/lib/startup.jar -jar /usr/share/openfire/lib/startup.jar' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'stdout_logfile = /var/log/supervisor/%(program_name)s.log' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'redirect_stderr = true' >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'autorestart=true' >> /etc/supervisor/conf.d/supervisord.conf
