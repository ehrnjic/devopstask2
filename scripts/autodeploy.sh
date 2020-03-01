#!/bin/bash

sudo apt-get update -qq && sudo apt-get install -y -qq curl

echo 'deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' | sudo tee -a /etc/apt/sources.list
curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -	
sudo apt-get install -y -qq postgresql-10 openjdk-8-jdk maven git nodejs

sudo -u postgres psql postgres -c "CREATE DATABASE demodb"
sudo -u postgres psql postgres -c "CREATE USER demouser WITH LOGIN PASSWORD 'DemoSecret'"
sudo -u postgres psql postgres -c "GRANT ALL ON DATABASE demodb TO demouser"

git clone https://github.com/kkenan/basic-microservices.git /home/vagrant/basic-microservices

cd /home/vagrant/basic-microservices/spring-boot-app/
mvn -B clean package
nohup java -jar target/spring-boot-app-1.0-SNAPSHOT.jar --spring.config.location=$HOME/resources/devopstask2-springapp.yml > spring-out.log &

cd /home/vagrant/basic-microservices/node-app/
npm install
nohup node index.js > ./node-out.log &

echo "Pause 10 sec until spring service become up"

sleep 10s
bash ../health_check.sh
