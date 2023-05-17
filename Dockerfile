FROM tomcat:9.0
WORKDIR /usr/local/tomcat/webapps
COPY target/CounterWebApp.war ./ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
