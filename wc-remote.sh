#!/usr/bin/env bash

infile=checkstyle.xml
#infile=gs://dataflow-samples/shakespeare/kinglear.txt
outfile="gs://mchu/outwhere/file1"
project=kabam-bi-adhoc
staging=gs://mchu/somewhere
#opts="--filesToStage=checkstyle.xml ${outfile}"

mvn bundle:bundle -pl examples

#java -cp examples/target/google-cloud-dataflow-java-examples-all-bundled-manual_build.jar \
mvn exec:java -pl examples \
  -Dexec.mainClass=com.google.cloud.dataflow.examples.WordCount \
  -Dexec.args="--output=${outfile} --project=${project} --stagingLocation=${staging} --runner=BlockingDataflowPipelineRunner"
  #-Dexec.args="--filesToStage=${infile} --output=${outfile} --project=${project} --stagingLocation=${staging} --runner=BlockingDataflowPipelineRunner"
  #-Dexec.args="--input=${infile} --filesToStage=${infile} --output=${outfile} --project=${project} --stagingLocation=${staging} --runner=BlockingDataflowPipelineRunner"
