#!/bin/sh


# 环境变量的维护

# 动机 : 

# 某些程序需要修改环境,如进入其他目录,修改字符集变量等;比较优雅的处理方式是程序结束之后,对这些环境变量进行还原

# 参考例子:

# # 保存环境变量

# old_lang=$LANG

# old_dir=`pwd`

# # 修改环境变量

# export.UTF-8

# cd /

# # 还原环境变量

# export LANG=${old_lang}

# cd ${old_dir}

# 输出和日志

# 动机 : 

# 为了日志的美观和统一性,可以统一定义日志输出的格式,如加上日志输出的时间

# 参考例子(日志内容之前加上时间戳):

# ret_status="OK"

# echo -e `date "+%F %T"` " cluster switch is ${ret_status} "

export ROOT=$(pwd)

export DAEMON=false
export LOG_PATH='"./logs/"'

while getopts "DKUl:" arg
do
    case $arg in
        R)
            export DAEMON=true
            ;;
        P)
            export DAEMON=true
            ;;
        T)
            export DAEMON=true
            ;;
        S)
            export DAEMON=true
            ;;
        E)
            export DAEMON=true
            ;;
        D)
            export DAEMON=true
            ;;
        K)
            kill `cat $ROOT/run/skynet.pid`
            exit 0;
            ;;
        l)
            export LOG_PATH='"'$OPTARG'"'
            ;;
        U)
            echo 'start srv_hotfix' | nc 127.0.0.1 8000
            exit 0;
            ;;
    esac
done


