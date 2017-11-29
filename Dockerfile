# Installation for Centos7 and Fedora
FROM centos:centos7

# EPEL
RUN yum install -y epel-release
# MySQL: 
RUN yum install -y community-mysql-server mysql mysql-devel
# Apache/PHP: 
RUN yum install -y httpd php php-mysql php-pdo php-gd php-snmp php-mbstring php-bcmath
# To enable Unicode, add "character-set-server=utf8" line to "[mysqld]" section of "/etc/my.cnf" file and restart mysqld.
#RUN 
# Install dev tools
RUN yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
# Install ruby
RUN yum install -y ruby ruby-rdoc ruby-devel rubygems
RUN gem update
RUN gem update --system
# Clone racktables
ENV HOME /root
RUN git clone https://github.com/RackTables/racktables.git $HOME/racktables



#RUN cd $(find -type d -name 'RackTables-*') && rmdir /var/www/html && cp -a wwwroot /var/www/html
#RUN touch /var/www/html/inc/secret.php && chmod 666 /var/www/html/inc/secret.php

#ADD init.sql /usr/local/share/racktables/init.sql
#RUN service mysqld start && cat /usr/local/share/racktables/init.sql | mysql -u root
#ADD chsecret.sh /usr/local/share/racktables/chsecret.sh
#RUN chmod +x /usr/local/share/racktables/chsecret.sh

#ADD start.sh /usr/local/bin/start
#RUN chmod +x /usr/local/bin/start
#ADD stop.sh /usr/local/bin/stop
#RUN chmod +x /usr/local/bin/stop

EXPOSE 8080

#CMD /usr/local/bin/start && tail -F /var/log/httpd/*
