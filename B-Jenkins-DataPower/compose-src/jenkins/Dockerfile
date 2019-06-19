# Steve Edwards, Escala Ltd., 2019-06-19
# Create Jenkins image with DataPower DCM product and deploy file, Ant and nano editor.
FROM jenkins/jenkins:lts
# These are the CLI scripts that allow export / importing of Jenkins jobs, with subfolders containing configurations:
COPY ./scripts /var/jenkins_scripts
# These are the files that DCM will use for deployment, with properties file(s) for various environments:
COPY ./dcm-deployment /var/dcm-deployment
# For installation via apt: 
USER root
# Update and install Ant (needed) and nano:
RUN apt-get update && apt-get install -y ant && apt-get install -y nano
# Put DCM product deploy.ant.xml in /var/dcm-product (needs more than the ant file):
# RUN wget --directory-prefix=/var/dcm-product https://raw.githubusercontent.com/ibm-datapower/datapower-configuration-manager/master/deploy.ant.xml
RUN git clone https://github.com/ibm-datapower/datapower-configuration-manager/ /var/dcm-product
# Put DCM product dcm.jar in /var/dcm-product/dist:
RUN wget --directory-prefix=/var/dcm-product/dist https://github.com/ibm-datapower/datapower-configuration-manager/releases/download/20/dcm.jar
# Following needs to be done, otherwise DCM cannot create, delete tempoary files:
RUN chown -R jenkins:jenkins /var/dcm-product
# Drop back to the regular jenkins user - good practice
USER jenkins

## ALL JUST NOTES, SAMPLES BELOW:
# CANNOT PUT STUFF IN JENKINS_HOME:
# docker exec -it a_jenkins_1 ls var/dcm-product
# BUT WITH THIS YOU CAN:
# docker container exec --user root -i -t a_jenkins_1 /bin/bash
# Targets		clean
# Build File	/var/dcm-product/deploy.ant.xml
# Properties	dcm.dir=/var/dcm-product

