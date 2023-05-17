FROM tomcat
WORKDIR /usr/local/tomcat/webapps
COPY /var/lib/jenkins/workspace/java-project/target/CounterWebApp.war ./
RUN mv CounterWebApp.war ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
