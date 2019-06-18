# Outputs all job configuration files to $JENKINS_HOME/exports
# Hints taken from: https://stackoverflow.com/questions/8424228/export-import-jobs-in-jenkins
id="steve";
pw="steve";
output_dir="${JENKINS_HOME}/exports";
# Make output directory if it doesn't exist:
mkdir -p $output_dir;
jobs=$(java -jar $JENKINS_HOME/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 -auth $id:$pw list-jobs);
for j in $jobs
 do
   echo $j;
   java -jar $JENKINS_HOME/war/WEB-INF/jenkins-cli.jar -s http://localhost:8080 -auth $id:$pw get-job ${j} > ${output_dir}/${j}.xml;
 done
echo "Exports located here: ${output_dir}"
