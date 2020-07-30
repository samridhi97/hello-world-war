## FROM deepakaiden/apachetomcat
FROM sri199008/dockertomcat
LABEL Author="Srikant"
LABEL description="Use dockertomcat image as base image for custom tomcat deployment"
USER root
COPY $WORKSPACE/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
