FROM linuxeasy/docker-jdk7-tomcat8

RUN cd /opt/tomcat/apache-tomcat-8.5.32/webapps \
    && wget https://github.com/linuxeasy/lib-mgt-download/raw/master/libraryapp-1.war -O libraryapp.war

ENV jdbc.driver_class org.mariadb.jdbc.Driver
ENV jdbc.url jdbc:mariadb://localhost:3306/cs548_library
ENV jdbc.username root
ENV jdbc.password root

	
EXPOSE 8080

CMD ["/opt/tomcat/apache-tomcat-8.5.32/bin/catalina.sh", "run"]

