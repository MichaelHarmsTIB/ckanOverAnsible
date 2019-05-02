#!/bin/bash

#Important for Ubuntu 18.04 64 bit / jetty9 not observe symlink

sudo ln -s /etc/solr/solr-jetty.xml /var/lib/jetty9/webapps/solr.xml