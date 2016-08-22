##About this Repo 

This is the Git repo of the Docker image for Kibana. 

###Usage 

##If you would like to set to environment variable 

* elasticsearch.url: 'http://ELASTICSEARCH_HOST:ELASTICSEARCH_PORT'

* server.maxPayloadBytes: SERVER_MAX_PAY_LOAD_BYTES -> byte size 

* elasticsearch.preserveHost: ELASTICSEARCH_PRESERVE_HOST -> true or false

* kibana.index: KIBANA_INDEX -> Kibana uses an index in Elasticsearch to store saved searches, visualizations and dashboards. 

* kibana.defaultAppId: KIBANA_DEFAULT_APP_ID -> application name 

* elasticsearch.pingTimeout: ELASTICSEARCH_PING_TIME_OUT -> Time in milliseconds

* elasticsearch.requestTimeout: ELASTICSEARCH_REQUEST_TIME_OUT -> Time in milliseconds

* elasticsearch.shardTimeout: ELASTICSEARCH_SHARD_TIME_OUT -> Time in milliseconds

* elasticsearch.startupTimeout: ELASTICSEARCH_STARTUP_TIME_OUT -> Time in milliseconds
 
* logging.dest: LOGGING_DEST ->  If you would like to send the log output to a file you can set the path below. 

* logging.silent: LOGGING_SILENT -> true or false

* logging.quiet: LOGGING_QUIET -> true or false 

* logging.verbose: LOGGING_VERBOSE -> true or false 

* server.ssl.cert: SERVER_SSL_CERT 

* server.ssl.key: SERVER_SSL_KEY

* elasticsearch.username: ELASTICSEARCH_USER

* elasticsearch.password: ELASTICSEARCH_PASS

* pid.file: PID_FILE

##Kibana use default variable.

* ELASTICSEARCH_HOST: localhost

* ELASTICSEARCH_PORT: 9200

* SERVER_MAX_PAY_LOAD_BYTES: 1048576
 
* ELASTICSEARCH_PRESERVE_HOST: true

* KIBANA_INDEX: .kibana

* KIBANA_DEFAULT_APP_ID: discover

* ELASTICSEARCH_PING_TIME_OUT: 1500

* ELASTICSEARCH_REQUEST_TIME_OUT: 30000

* ELASTICSEARCH_SHARD_TIME_OUT: 0

* ELASTICSEARCH_STARTUP_TIME_OUT: 5000

* LOGGING_DEST: stdout

* LOGGING_SILENT: false

* LOGGING_QUIET: false

* LOGGING_VERBOSE: false


###Run Example

`docker run -d -p 5601:5601 -e ELASTICSEARCH_HOST=localhost --name kibana`

if you want SSL for outgoing requests, use -v parameter.

SERVER_SSL_CERT environment valiable's path must same /path/to/your/container/cert/
SERVER_SSL_KEY environment valiable's path must same /path/to/your/container/key/

`docker run -d -p 5601:5601 -e SERVER_SSL_CERT=/path/to/your/container/server.crt -e SERVER_SSL_KEY=/path/to/your/container/server.key -v /path/to/your/host/cert/:/path/to/container/cert/ -v /path/to/your/host/key/:/path/to/your/container/key/ --name kibana`


if you enter user environment variable, you must enter password environment.
if you enter password environment variable, you must enter user environment.

`docker run -d -p 5601:5601 -e ELASTICSEARCH_USER=user -e ELASTICSEARCH_PASS=password --name kibana`
