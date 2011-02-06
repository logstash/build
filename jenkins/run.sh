if [ ! -f jenkins.war ] ; then 
  wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
fi

screen -S jenkins -RR env JENKINS_HOME=./ci java -jar jenkins.war
