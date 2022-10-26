FROM anapsix/alpine-java
COPY target/*.jar /home/*.jar
CMD ["java","-jar","/home/spring-petclinic-2.7.3.jar"]
