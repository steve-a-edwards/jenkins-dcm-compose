FROM jenkins/jenkins:lts
COPY ./scripts /var/jenkins_scripts
# if we want to install via apt
USER root
# Update and install Ant (needed)
RUN apt-get update && apt-get install -y ant

# Put DCM product deploy.ant.xml in /var/dcm-product (needs more than the ant file:
# RUN wget --directory-prefix=/var/dcm-product https://raw.githubusercontent.com/ibm-datapower/datapower-configuration-manager/master/deploy.ant.xml
RUN git clone https://github.com/ibm-datapower/datapower-configuration-manager/ /var/dcm-product
# Put DCM product dcm.jar in /var/dcm-product/dist:
RUN wget --directory-prefix=/var/dcm-product/dist https://github.com/ibm-datapower/datapower-configuration-manager/releases/download/20/dcm.jar
# drop back to the regular jenkins user - good practice
USER jenkins

# CANNOT PUT STUFF IN JENKINS_HOME:
# docker exec -it a_jenkins_1 ls var/dcm-product
# BUT WITH THIS YOU CAN:
# docker container exec --user root -i -t a_jenkins_1 /bin/bash
# Targets		clean
# Build File	/var/dcm-product/deploy.ant.xml
# Properties	dcm.dir=/var/dcm-product

