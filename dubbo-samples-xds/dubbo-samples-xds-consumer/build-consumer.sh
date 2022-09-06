#!/bin/sh

#cd ../../ && mvn clean && sleep 3s && mvn package -Dmaven.test.skip=true

#cd deploy/deploy-provider/

#echo '-----copy jar----'
#rm -f dubbo-demo-provider.jar
#cat Dockerfile

#cp ../../dubbo-demo-provider/target/dubbo-demo-provider.jar .
echo '-------build image-----------'
docker build -f Dockerfile -t dockeddocking/dubbo:consumer.agent.v1.12  .
docker push dockeddocking/dubbo:consumer.agent.v1.12
echo '-------push image success-----------'

docker rmi -f $(docker images|grep none |awk '{print $3}')
echo '-----deploy images success----'
