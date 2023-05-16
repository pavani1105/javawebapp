FROM tomcat:latest 
WORKDIR webapps 
COPY target/CounterWebApp.war .
RUN rm -rf ROOT
RUN touch ROOT.war
RUN mv CounterWebApp.war ROOT.war
EXPOSE 8080
CMD ["sh", "catalina.sh", "run"]
