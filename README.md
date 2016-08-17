##About this Repo 

This is the Git repo of the Docker image for Kibana. 

###Usage 

##If you would like to set to environment variable 

* elasticsearch.url: 'http://ELASTICSEARCH_HOST:ELASTICSEARCH_PORT'

* server.maxPayloadBytes: SERVER_MAX_PAY_LOAD_BYTES -> byte size 

* elasticsearch.preserveHost: ELASTICSEARCH_PRESERVE_HOST -> true or false

* kibana.defaultAppId: KIBANA_DEFAULT_APP_ID -> application name 

* elasticsearch.pingTimeout: ELASTICSEARCH_PING_TIME_OUT -> Time in milliseconds

* elasticsearch.requestTimeout: ELASTICSEARCH_REQUEST_TIME_OUT -> Time in milliseconds

* elasticsearch.shardTimeout: ELASTICSEARCH_SHARD_TIME_OUT -> Time in milliseconds

* elasticsearch.startupTimeout: ELASTICSEARCH_STARTUP_TIME_OUT -> Time in milliseconds

* logging.dest: LOGGING_DEST -> Identify path

* logging.silent: LOGGING_SILENT -> true or false

* logging.quiet: LOGGING_QUIET -> true or false 

* logging.verbose: LOGGING_VERBOSE -> true or false 


##Kibana use default variable.

* ELASTICSEARCH_HOST: localhost

* ELASTICSEARCH_PORT: 9200

* SERVER_MAX_PAY_LOAD_BYTES: 1048576
 
* ELASTICSEARCH_PRESERVE_HOST: true

* KIBANA_DEFAULT_APP_ID: discover

* ELASTICSEARCH_PING_TIME_OUT: 1500

* ELASTICSEARCH_REQUEST_TIME_OUT: 30000

* ELASTICSEARCH_SHARD_TIME_OUT: 0

* ELASTICSEARCH_STARTUP_TIME_OUT:

* LOGGING_DEST: stdout

* LOGGING_SILENT: false

* LOGGING_QUIET: false

* LOGGING_VERBOSE: false


###Run Example

`docker run -d -p 5601:5601 -e ELASTICSEARCH_HOST=localhost --name kibana`
