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

RUN mkdir /opt/jfp_deadline
COPY deadline_launch.sh /opt/jfp_deadline/
WORKDIR /opt/jfp_deadline
RUN chmod 755 deadline_launch.sh

ENTRYPOINT ["./deadline_launch.sh"]
