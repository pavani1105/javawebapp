FROM tomcat
WORKDIR /usr/local/tomcat/webapps
COPY /var/lib/jenkins/target/workspace/java-project/target/*.war ./
RUN mv *.war ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
