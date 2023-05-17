FROM tomcat
WORKDIR webapps 
COPY target/CounterWebApp.war .
RUN rmv CounterWebApp.war ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
