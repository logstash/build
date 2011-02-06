set -e
[ ! -d "logstash" ] && git clone git://github.com/logstash/logstash.git

# Requires rvm

rvm="$HOME/.rvm/scripts/rvm"
HOME=$PWD

. "$rvm"
cd logstash

git pull origin master
git checkout master

ruby="ruby-1.8.7"

if ! rvm list | grep "$ruby" ; then
  rvm install "$ruby"
fi

rm *.gem
rvm gemset create logstash
rvm "$ruby" gem remove -axy logstash
rvm "$ruby" gem build logstash.gemspec
rvm "$ruby" gem install -y logstash-*.gem


