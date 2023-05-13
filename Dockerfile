FROM tomcat 
WORKDIR WebApp
COPY target/CounterWebApp.war .
RUN rm -rf ROOT && mv CounterWebApp.war ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
