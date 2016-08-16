#!/bin/sh

set -e

LOGGING_DEST=${LOGGING_DEST:-stdout}
LOGGING_SILENT=${LOGGING_SILENT:-false}
LOGGING_QUIET=${LOGGING_QUIET:-false}
LOGGING_VERBOSE=${LOGGING_VERBOSE:-false}

ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-localhost} 
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}

sed -i "s/ELASTICSEARCH_HOST/${ELASTICSEARCH_HOST}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_PORT/${ELASTICSEARCH_PORT}/g" /$KIBANA_CONF_DIR/kibana.yml

sed -i "s/LOGGING_DEST/${LOGGING_DEST}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_SILENT/${LOGGING_SILENT}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_QUIET/${LOGGING_QUIET}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_VERBOSE/${LOGGING_VERBOSE}/g" /$KIBANA_CONF_DIR/kibana.yml

if [ ! -z  ${ELASTICSEARCH_USER} ]
then
	sed -i "s/#elasticsearch.username/elasticsearch.username/g" /$KIBANA_CONF_DIR/kibana.yml
	sed -i "s/ELASTICSEARCH_USER/${ELASTICSEARCH_USER}/g" /$KIBANA_CONF_DIR/kibana.yml
	
	if [ -z ${ELASTICSEARCH_PASS} ]
	then
		echo "password gir"
		exit 1
	fi

fi

if [ ! -z ${ELASTICSEARCH_PASS} ]
then
	sed -i "s/#elasticsearch.password/elasticsearch.password/g" /$KIBANA_CONF_DIR/kibana.yml
	sed -i "s/ELASTICSEARCH_PASS/${ELASTICSEARCH_PASS}/g" /$KIBANA_CONF_DIR/kibana.yml

        if [ -z ${ELASTICSEARCH_USER} ]
        then
                echo "user girmediniz"
		exit  1
	fi

fi

exec "$@"
