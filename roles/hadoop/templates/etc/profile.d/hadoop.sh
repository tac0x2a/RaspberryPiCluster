# {{ ansible_managed }}

export HADOOP_USER_NAME=hadoop
export HADOOP_HOME=/usr/src/hadoop-3.0.0
export PATH=$PATH:$HADOOP_HOME/bin
export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
