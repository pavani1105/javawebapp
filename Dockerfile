FROM tomcat:9.0.75-jdk8-corretto-al2
WORKDIR webapps 
COPY target/CounterWebApp.war .
RUN rm -rf ROOT && mv CounterWebApp.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
