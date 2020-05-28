#!/bin/bash
source ./slack.conf

usage()
{
    echo "Help page"
}

echo "$API_HOOK"

while [ "$1" != "" ]; do
    case $1 in
        -m | --message )        shift
                                message=$1
                                ;;
        -i | --interactive )    interactive=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

curl -X POST -H "Content-type: application/json" --data "{\"text\":\"$message\"}" $API_HOOK