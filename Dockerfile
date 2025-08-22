# Step 1: Base image (Tomcat)
FROM tomcat:9.0-jdk17

# Step 2: WAR file ko Tomcat ke webapps folder me copy karo
COPY target/auth-app.war /usr/local/tomcat/webapps/auth-app.war

# Step 3: Container start hone par Tomcat run karega (default CMD already Tomcat run karta hai)
Expose 8080