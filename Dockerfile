FROM centos
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN curl - O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.88/bin/apache-tomcat-8.5.88.tar.gz
RUN tar xvzf apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
WORKDIR /opt/tomcat/webapps
COPY /var/lib/jenkins/workspace/tomcat/target/WebApp.war /opt/tomcat/webapps
RUN rm -rf ROOT && mv WebApp.war ROOT.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
