# Step 1: Base image (Tomcat)
FROM tomcat:10.1-jdk17

# Step 2: WAR file ko Tomcat ke webapps folder me copy karo
COPY target/auth-app.war /usr/local/tomcat/webapps/auth-app.war

# Step 3: Expose Tomcat Default
EXPOSE 8080