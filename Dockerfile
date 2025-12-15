FROM ibmjava:11-jdk

WORKDIR /tmp

# Check if the build is performed in hermetic environment
# (without access to the internet)
RUN if curl -s example.com > /dev/null; then echo "build is not being performed in hermetic environment" && exit 1; fi

# use jar to unzip file in order to avoid having to install more dependencies
RUN jar -xvf /cachi2/output/deps/generic/dependency-check.zip

RUN chmod +x dependency-check/bin/dependency-check.sh

ENTRYPOINT ["/tmp/dependency-check/bin/dependency-check.sh", "--version"]