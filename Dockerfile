FROM tomcat 
WORKDIR webapps 
COPY target/CounterWebApp.war .
RUN rm -rf ROOT && mv CounterWebApp.war ROOT.war
EXPOSE 8082
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
