FROM tomcat:latest 
WORKDIR webapps 
COPY target/CounterWebApp.war .
RUN rm -rf ROOT && mv CounterWebApp.war ROOT.war
EXPOSE 8080
CMD ["sh", "catalina.sh", "run"]
