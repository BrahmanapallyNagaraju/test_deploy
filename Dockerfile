FROM tomcat:8.5.56-jdk14-openjdk-oracle
RUN cp -avT $CATALINA_HOME/webapps.dist/ $CATALINA_HOME/webapps/
COPY roshambo.war /usr/local/tomcat/webapps/roshambo.war
