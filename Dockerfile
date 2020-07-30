## FROM deepakaiden/apachetomcat
FROM samridhi9719/dockertomcat
LABEL Author="Samridhi"
LABEL description="Use dockertomcat image as base image for custom tomcat deployment"
USER root
COPY $WORKSPACE/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
