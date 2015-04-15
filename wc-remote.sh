#!/usr/bin/env bash

project=kabam-bi-adhoc
staging=gs://mchu/somewhere
output="--output=gs://mchu/outwhere/file1"
opts="--filesToStage=checkstyle.xml ${output}"

mvn bundle:bundle -pl examples

java -cp examples/target/google-cloud-dataflow-java-examples-all-bundled-manual_build.jar \
  com.google.cloud.dataflow.examples.WordCount \
  --project=${project} \
  --stagingLocation=${staging} \
  --runner=BlockingDataflowPipelineRunner \
  ${opts}
