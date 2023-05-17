FROM tomcat
WORKDIR /usr/local/tomcat/webapps
COPY /target/*.war ./
RUN mv *.war ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
