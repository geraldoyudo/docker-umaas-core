FROM geraldoyudo/java-8-maven-git

ENV projectUrl https://gerald_oyudo@bitbucket.org/gerald_oyudo/umaas.git
ENV projectBranch production
ENV logFolder ${log:-/user/service/out.txt}
ENV fileName umaas-core.jar

COPY conf/application.yml /conf/application.yml
COPY entry-point.sh /entry-point.sh

RUN svn checkout ${projectUrl}/branches/${branch:-master}/ project &&/
	cd project &&/
	mvn install -DskipTests &&/
	cp *.* /workdir
	
ENTRYPOINT ["/entry-point.sh"]

