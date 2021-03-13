#!/bin/sh
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /round1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../Lab1/access.log /round1/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.9.2.jar \
-file ../../Lab1/round1/mapper.py -mapper ../../Lab1/round1/mapper.py \
-file ../../Lab1/round1/reducer.py -reducer ../../Lab1/round1/reducer.py \
-input /round1/input/* -output /round1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /round1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /round1/input/
../../stop.sh
