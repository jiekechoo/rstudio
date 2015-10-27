FROM centos:6.7
MAINTAINER Jieke Choo jiekechoo@sectong.com

RUN yum install -y epel-release 

RUN yum install -y R

RUN curl -s http://download2.rstudio.org/rstudio-server-rhel-0.99.486-x86_64.rpm -o rstudio-server-rhel-0.99.486-x86_64.rpm

RUN yum install -y --nogpgcheck rstudio-server-rhel-0.99.486-x86_64.rpm

RUN yum install -y supervisor

RUN useradd rstudio && echo "rstudio:talent" | chpasswd

COPY rstudio.conf /etc/supervisor/conf.d/rstudio.conf

RUN chmod 777 -R /usr/share/R/library/

EXPOSE 8787

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/rstudio.conf" ] 
