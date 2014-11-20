FROM bugsbioscience/bugs-base

# Install R
RUN add-apt-repository "deb http://cran.rstudio.com/bin/linux/ubuntu $(lsb_release -cs)/"
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN apt-get -y update && apt-get -y install r-recommended maven

COPY rserve.jar rengine.jar /opt/bugsbio/
COPY r-install.sh           /opt/bugsbio/bin/r-install.sh
COPY lib                    /opt/bugsbio/lib
COPY Rfile                  /opt/bugsbio/Rfile

RUN cd /opt/bugsbio && mvn deploy:deploy-file -Dfile=rserve.jar -DartifactId=rserve -Dversion=1.8-0 -DgroupId=rserve -Dpackaging=jar -Durl=file:/opt/bugsbio/local-maven-repo
RUN cd /opt/bugsbio && mvn deploy:deploy-file -Dfile=rengine.jar -DartifactId=rengine -Dversion=1.8-0 -DgroupId=rengine -Dpackaging=jar -Durl=file:/opt/bugsbio/local-maven-repo

RUN ["chmod", "+x", "/opt/bugsbio/bin/r-install.sh"]
RUN cd /opt/bugsbio && bin/r-install.sh
