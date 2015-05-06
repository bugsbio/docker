FROM bugsbioscience/bugs-base

# Install R
RUN add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -cs)/"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get -y update && apt-get -y install r-recommended maven libcurl4-gnutls-dev libxml2-dev

COPY r-install.sh           /opt/bugsbio/bin/r-install.sh
COPY lib                    /opt/bugsbio/lib
COPY Rfile                  /opt/bugsbio/Rfile

RUN ["chmod", "+x", "/opt/bugsbio/bin/r-install.sh"]
RUN cd /opt/bugsbio && bin/r-install.sh
