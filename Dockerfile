FROM centos:7

RUN yum -y upgrade
RUN yum install -y redhat-lsb libX11 libXext mesa-libGL

RUN mkdir /tmp/Thinkbox

COPY Deadline-10.2.0.9-linux-installers.tar /tmp/Thinkbox/

WORKDIR /tmp/Thinkbox
RUN tar -xvf Deadline-10.2.0.9-linux-installers.tar

RUN ./DeadlineClient-10.2.0.9-linux-x64-installer.run --mode unattended --repositorydir /mnt/dlprodrepo/ --slavestartup false --unattendedmodeui minimal --enabletls false

EXPOSE 8081
EXPOSE 8082

RUN rm -rf Deadline-10.2.0.9-*

ENTRYPOINT ["/opt/Thinkbox/Deadline10/bin/deadlinelauncher.exe -nogui -noslave -rcs -webservice"]
