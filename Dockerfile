FROM openjdk:8u111

ENV projectUrl http://test.isslserv.com:8081/artifactory/ext-snapshot-local/com/gerald/umaas/umaas-core/0.0.1-SNAPSHOT/umaas-core-0.0.1-20170105.152946-1.jar
ENV logFolder ${log:-/user/service/out.txt}
ENV fileName umaas-core.jar

RUN wget ${projectUrl} -O ${fileName}

COPY conf/application.yml /conf/application.yml
COPY entry-point.sh /entry-point.sh

ENTRYPOINT ["/entry-point.sh"]

