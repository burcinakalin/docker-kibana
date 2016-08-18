FROM debian:jessie

ENV KIBANA_VERSION 4.5.4
ENV KIBANA_FILE kibana-$KIBANA_VERSION-linux-x64.tar.gz
ENV KIBANA_EXTRACT_DIR /var/lib
ENV KIBANA_HOME_DIR $KIBANA_EXTRACT_DIR/kibana-$KIBANA_VERSION-linux-x64
ENV KIBANA_CONF_DIR $KIBANA_EXTRACT_DIR/kibana-$KIBANA_VERSION-linux-x64/config

RUN apt-get update && apt-get -y install curl && \
    curl https://download.elastic.co/kibana/kibana/$KIBANA_FILE --output $KIBANA_FILE && \
    tar -xzf $KIBANA_FILE -C $KIBANA_EXTRACT_DIR

COPY kibana.yml $KIBANA_CONF_DIR

ENV PATH $KIBANA_HOME_DIR/bin:$PATH

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5601

CMD ["kibana"]
