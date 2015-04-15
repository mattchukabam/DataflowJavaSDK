#!/usr/bin/env bash

infile=checkstyle.xml
outfile=/tmp/a

mvn exec:java -pl examples \
  -Dexec.mainClass=com.google.cloud.dataflow.examples.WordCount \
  -Dexec.args="--input=${infile} --output=${outfile}"
