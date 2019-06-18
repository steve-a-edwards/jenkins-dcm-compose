echo "This script will import Jenkins job XML config files"
id="steve";
pw="steve";
files=`ls import-configs/jobs/*.xml`;
echo "Processing files";
echo $files;
for f in $files;
do
  echo "File name: ${f}";
  job_name=$(basename ${f%.*});
  echo "Job name: ${job_name}";
  echo "Processing file: ${f}";
  java -jar $JENKINS_HOME/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 -auth $id:$pw create-job $job_name < $f;
done
