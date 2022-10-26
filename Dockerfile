FROM anapsix/alpine-java
COPY /var/lib/jenkins/workspace/3nd project/target/spring-petclinic-2.7.3.jar /usr/local/tomcat/webapps/spring-petclinic-2.7.3.jar
CMD ["java","-jar","/usr/local/tomcat/webapps/spring-petclinic-2.7.3.jar"]
