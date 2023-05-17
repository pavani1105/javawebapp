FROM tomcat:9.0.54
WORKDIR webapps 
COPY target/CounterWebApp.war .
RUN rm -rf ROOT && mv CounterWebApp.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
