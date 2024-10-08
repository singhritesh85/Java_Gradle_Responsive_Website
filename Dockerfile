FROM eclipse-temurin:11-jdk as base 
WORKDIR /app
COPY . . 
#RUN chmod +x gradlew
#RUN ./gradlew build 

FROM tomcat:9
WORKDIR webapps
COPY --from=base /app/build/libs/Responsive_website-0.0.1-SNAPSHOT.war .
RUN rm -rf ROOT && mv Responsive_website-0.0.1-SNAPSHOT.war ROOT.war   
