FROM geraldoyudo/java-8-maven-git

ENV projectUrl http://test.isslserv.com:8081/artifactory/ext-snapshot-local/com/gerald/umaas/umaas-core/0.0.1-SNAPSHOT/umaas-core-0.0.1-20170105.152946-1.jar
ENV logFolder ${log:-/user/service/out.txt}
ENV fileName umaas-core.jar

COPY conf/application.yml /conf/application.yml
COPY entry-point.sh /entry-point.sh

RUN wget ${projectUrl} -O /workdir/${fileName}
	
ENTRYPOINT ["/entry-point.sh"]

