#!/bin/bash


#This plugin checks to make sure that the "amq" queues are not missing from the RabbitMQ checks

#command[check_amq]=/usr/local/nagios/libexec/check_qmq.sh

statuscode=$statuscode
                {
                statuscode=$(rabbitmqctl list_queues | grep [a][m][q]\.[g][e][n] )
                if [ -z "$statuscode" ]
                then
                echo "CRITICAL - AMQ QUEUES ARE MISSING";
                retval=2;

                else
                echo "AMQ QUEUES ARE PRESENT";
                echo "$statuscode";
                retval=0;
                fi
                exit $retval;

                }
