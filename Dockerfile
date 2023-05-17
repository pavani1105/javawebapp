FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY target/CounterWebApp.war /usr/local/tomcat/webapps/ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
