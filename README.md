[![](https://images.microbadger.com/badges/version/burcina/docker-kibana.svg)](http://microbadger.com/images/burcina/docker-kibana "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/burcina/docker-kibana.svg)](http://microbadger.com/images/burcina/docker-kibana "Get your own image badge on microbadger.com")


## About this Repo 

This is the Git repo of the Docker image for Kibana. 

### If you would like to set to environment variable: environment variable -> explanation -> default variable

* elasticsearch.url: 'http://ELASTICSEARCH_HOST:ELASTICSEARCH_PORT'  
  `ELASTICSEARCH_HOST` -> localhost
  `ELASTICSEARCH_PORT` -> 9200

* `SERVER_MAX_PAYLOAD_BYTES` -> byte size -> 1048576

* `ELASTICSEARCH_PRESERVE_HOST` -> true or false -> true 

* `KIBANA_INDEX` -> Kibana uses an index in Elasticsearch to store saved searches, visualizations and dashboards. -> .kibana

* `KIBANA_DEFAULT_APP_ID` -> application name -> discover

* `ELASTICSEARCH_PING_TIMEOUT` -> Time in milliseconds -> 1500

* `ELASTICSEARCH_REQUEST_TIMEOUT` -> Time in milliseconds -> 30000

* `ELASTICSEARCH_SHARD_TIMEOUT` -> Time in milliseconds -> 0

* `ELASTICSEARCH_STARTUP_TIMEOUT` -> Time in milliseconds -> 5000
 
* `LOGGING_DEST` ->  If you would like to send the log output to a file you can set the path below. -> stdout

* `LOGGING_SILENT` -> true or false -> false 

* `LOGGING_QUIET` -> true or false -> false 

* `LOGGING_VERBOSE` -> true or false -> false

* SSL for outgoing requests from the Kibana Server to the browser.
  `SERVER_SSL_CERT` 

  `SERVER_SSL_KEY`

* If your Elasticsearch is protected with basic auth.
  `ELASTICSEARCH_USER`

  `ELASTICSEARCH_PASS`

* Set the path to where you would like the process id file to be created.
   `PID_FILE`

## Usage

The basic commands that can be executed:
`docker run -d -p 5601:5601 -e ELASTICSEARCH_HOST=your_elasticsearch_host burcina/docker-kibana`

### if you want SSL for outgoing requests, use volume.

SERVER_SSL_CERT environment valiable's path must same /path/to/your/container/cert/
SERVER_SSL_KEY environment valiable's path must same /path/to/your/container/key/

`docker run -d -p 5601:5601 -e ELASTICSEARCH_HOST=your_elasticsearch_host -e SERVER_SSL_CERT=/path/to/your/container/server.crt -e SERVER_SSL_KEY=/path/to/your/container/server.key -v /path/to/your/host/cert/:/path/to/container/cert/ -v /path/to/your/host/key/:/path/to/your/container/key/ burcina/docker-kibana`

if you enter user environment variable, you must enter password environment.
if you enter password environment variable, you must enter user environment.

`docker run -d -p 5601:5601 -e ELASTICSEARCH_HOST=your_elasticsearch_host -e ELASTICSEARCH_USER=your_user -e ELASTICSEARCH_PASS=your_password burcina/docker-kibana`


`docker run -d -p 5601:5601 -e ELASTICSEARCH_HOST=your_elasticsearch_host -e LOGGING_SILENT=true -e LOGGING_QUIET=true -e LOGGING_VERBOSE=true burcina/docker-kibana`

## Tag

1.3 -> Kibana-4.5.4 
