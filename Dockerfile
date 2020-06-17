FROM tomcat:8.5.56-jdk14-openjdk-oracle
RUN cp -avT $CATALINA_HOME/webapps.dist/ $CATALINA_HOME/webapps/
COPY /var/lib/jenkins/workspace/test_pipeline/target/roshambo.war $CATALINA_HOME/webappas/roshambo.war
