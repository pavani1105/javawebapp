FROM centos:7
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.88/bin/apache-tomcat-8.5.88.tar.gz .
RUN tar -xvzf apache*.tar.gz
RUN mv apache-tomcat-8*/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
COPY target/CounterWebApp.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/startup.sh", "run"]
