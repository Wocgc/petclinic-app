FROM tomcat:9.0.53-jdk8-openjdk

RUN apt update && apt install -y unzip

# 1. 기본 WAR 제거
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# 2. WAR 복사 및 압축 해제
COPY petclinic.war /tmp/petclinic.war
RUN mkdir /usr/local/tomcat/webapps/ROOT && \
    unzip /tmp/petclinic.war -d /usr/local/tomcat/webapps/ROOT

# 3. 기존 xml 제거
RUN rm -f /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/spring/datasource-config.xml

# 4. 새 datasource-config.xml 파일 복사
COPY datasource-config.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/spring

EXPOSE 8080
