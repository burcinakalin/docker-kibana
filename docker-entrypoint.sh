#!/bin/sh

set -e

#default value of environment variables
ELASTICSEARCH_HOST=${ELASTICSEARCH_HOST:-localhost} 
ELASTICSEARCH_PORT=${ELASTICSEARCH_PORT:-9200}

SERVER_BASEPATH=${SERVER_BASEPATH:-"\"\""}
SERVER_MAX_PAYLOAD_BYTES=${SERVER_MAX_PAYLOAD_BYTES:-1048576} 
ELASTICSEARCH_PRESERVE_HOST=${ELASTICSEARCH_PRESERVE_HOST:-true}
KIBANA_INDEX=${KIBANA_INDEX:-.kibana}
KIBANA_DEFAULT_APP_ID=${KIBANA_DEFAULT_APP_ID:-discover}
ELASTICSEARCH_PING_TIMEOUT=${ELASTICSEARCH_PING_TIMEOUT:-1500}
ELASTICSEARCH_REQUEST_TIMEOUT=${ELASTICSEARCH_REQUEST_TIMEOUT:-30000}
ELASTICSEARCH_SHARD_TIMEOUT=${ELASTICSEARCH_SHARD_TIMEOUT:-0}
ELASTICSEARCH_STARTUP_TIMEOUT=${ELASTICSEARCH_STARTUP_TIMEOUT:-5000}
LOGGING_DEST=${LOGGING_DEST:-stdout}
LOGGING_SILENT=${LOGGING_SILENT:-false}
LOGGING_QUIET=${LOGGING_QUIET:-false}
LOGGING_VERBOSE=${LOGGING_VERBOSE:-false}

sed -i "s/ELASTICSEARCH_HOST/${ELASTICSEARCH_HOST}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_PORT/${ELASTICSEARCH_PORT}/g" /$KIBANA_CONF_DIR/kibana.yml

sed -i "s/SERVER_BASEPATH/${SERVER_BASEPATH}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/SERVER_MAX_PAYLOAD_BYTES/${SERVER_MAX_PAYLOAD_BYTES}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_PRESERVE_HOST/${ELASTICSEARCH_PRESERVE_HOST}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/KIBANA_INDEX/${KIBANA_INDEX}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/KIBANA_DEFAULT_APP_ID/${KIBANA_DEFAULT_APP_ID}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_PING_TIMEOUT/${ELASTICSEARCH_PING_TIMEOUT}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_REQUEST_TIMEOUT/${ELASTICSEARCH_REQUEST_TIMEOUT}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_SHARD_TIMEOUT/${ELASTICSEARCH_SHARD_TIMEOUT}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/ELASTICSEARCH_STARTUP_TIMEOUT/${ELASTICSEARCH_STARTUP_TIMEOUT}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_DEST/${LOGGING_DEST}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_SILENT/${LOGGING_SILENT}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_QUIET/${LOGGING_QUIET}/g" /$KIBANA_CONF_DIR/kibana.yml
sed -i "s/LOGGING_VERBOSE/${LOGGING_VERBOSE}/g" /$KIBANA_CONF_DIR/kibana.yml

# username is entered but password isn't entered so returns an error message
if [ ! -z  ${ELASTICSEARCH_USER} ]
then
	sed -i "s/#elasticsearch.username:.*/elasticsearch.username: ${ELASTICSEARCH_USER}/g" /$KIBANA_CONF_DIR/kibana.yml

	if [ -z ${ELASTICSEARCH_PASS} ]
	then
		echo "please enter the password!"
		exit 1
	fi

fi
#password is entered but username isn't entered so returns an error message
if [ ! -z ${ELASTICSEARCH_PASS} ]
then
	sed -i "s/#elasticsearch.password:.*/elasticsearch.password: ${ELASTICSEARCH_PASS}/g" /$KIBANA_CONF_DIR/kibana.yml

        if [ -z ${ELASTICSEARCH_USER} ]
        then
                echo "please enter the username!"
		exit  1
	fi

fi

if [ ! -z ${PID_FILE} ]
then
	sed -i "s/#pid.file:.*/pid.file: ${PID_FILE}/g" /$KIBANA_CONF_DIR/kibana.yml
fi

if [ ! -z ${SERVER_SSL_CERT} ]
then
	sed -i "s/#server.ssl.cert:.*/server.ssl.cert: ${SERVER_SSL_CERT}/g" /$KIBANA_CONF_DIR/kibana.yml
fi

if [ ! -z ${SERVER_SSL_KEY} ]
then
	sed -i "#server.ssl.key:.*/server.ssl.key: ${SERVER_SSL_KEY}/g" /$KIBANA_CONF_DIR/kibana.yml
fi

exec "$@"
