FROM ibmjava:11-jdk

WORKDIR /tmp

# use jar to unzip file in order to avoid having to install more dependencies
RUN pwd

RUN ls -lrt

RUN jar -xvf /cachi2/output/deps/generic/dependency-check.zip

RUN ls -lrt

RUN chmod +x dependency-check/bin/dependency-check.sh

ENTRYPOINT ["/tmp/dependency-check/bin/dependency-check.sh", "--version"]