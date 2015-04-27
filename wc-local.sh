#!/usr/bin/env bash

infile=checkstyle.xml
#outfile=local-out
outfile=gs://mchu/wc-from-local

#rm -vf ${outfile}*

mvn bundle:bundle -pl examples

mvn exec:java -pl examples \
  -Dexec.mainClass=com.google.cloud.dataflow.examples.WordCount \
  -Dexec.args="--input=${infile} --output=${outfile}"

#cat ${outfile}* | head -n 10
