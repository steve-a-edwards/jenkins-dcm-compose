FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
# Update and install Ant (needed)
RUN apt-get update && apt-get install -y ant

# Put DCM product artifacts in /var/dcm-product:
RUN wget --directory-prefix=/var/dcm-product https://raw.githubusercontent.com/ibm-datapower/datapower-configuration-manager/master/deploy.ant.xml
RUN wget --directory-prefix=/var/dcm-product https://github.com/ibm-datapower/datapower-configuration-manager/releases/download/20/dcm.jar
# drop back to the regular jenkins user - good practice
USER jenkins



# CANNOT PUT STUFF IN JENKINS_HOME
# docker exec -it aa_jenkins_1 ls var/dcm-product