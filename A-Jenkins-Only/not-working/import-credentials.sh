echo "This script will import Jenkins credential XML config files"
id="steve";
pw="steve";
files=`ls import-configs/credentials/*.xml`;
echo "Processing files";
echo $files;
for f in $files;
do
  echo "File name: ${f}";
#  job_name=$(basename ${f%.*});
#  echo "Job name: ${job_name}";
  echo "Processing file: ${f}";
  cat $f
  java -jar $JENKINS_HOME/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 -auth $id:$pw import-credentials-as-xml system::system::jenkins < $f;
done
