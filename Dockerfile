FROM  solr:8.2-slim
ADD coradefaultcore /opt/solr/server/solr/configsets/coradefaultcore 

#ideas from: https://github.com/docker-solr/docker-solr-examples/tree/master/schema-api

#created by:
#docker run --rm -d --name solr-initial -p 8983:8983 solr:7.6-alpine solr-precreate coradefaultcore

# added field to scheama:
#curl -X POST -H 'Content-type:application/json' --data-binary '{
#  "add-field":{
#    "name":"ids",
#    "type":"string",
#    "multiValued":true,
#    "indexed":true,
#    "required":true,
#    "stored":true
#    }
#}' http://localhost:8983/solr/coradefaultcore/schema

#docker cp solr-initial:/opt/solr/server/solr/mycores/coradefaultcore /mnt/depot/eclipse201812forcora2/eclipseForCora/workspace/cora-docker-solr/
#docker kill solr-initial

#changed *_t to be multivalued in managed-schema.xml 
#remove file core.properties 
#end created by:


#build with:
#maven build

#start on development with:
#docker run --net=cora -p 8984:8983 --name solr  -d  -P solr solr-create -c coracore


#start on build server with:
#docker run --net=cora-test  --name solr-test -d  solr -P solr solr-create -c coracore

#start on external with:
#docker run --net=cora  --name solr  -d  solr -P solr solr-create -c coracore

#reomove unused volumes with:
#docker volume rm $(docker volume ls -q)