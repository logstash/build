if [ ! if jenkins.war ] ; then 
  wget http://mirrors.jenkins-ci.org/war/latest/jenkins.war
fi

screen -S jenkins -RR java -jar jenkins.war
