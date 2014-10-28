FROM dockerfile/java

# Install required packages
RUN echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list
RUN wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -

RUN apt-get update -y && apt-get -y install libpq-dev newrelic-sysmond

# NewRelic
COPY newrelic.jar /opt/monitoring/
RUN touch /var/log/newrelic_access.log
