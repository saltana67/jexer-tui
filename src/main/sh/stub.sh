#!/bin/sh
MYSELF=$(which "$0" 2>/dev/null)
[ $? -gt 0 ] && [ -f "$0" ] && MYSELF="./$0"
java=java
if test -n "$JAVA_HOME"; then
	java="$JAVA_HOME/bin/java"
fi

CMD_LINE=""
VERBOSE=""

while [ $# -gt 0 ]; do
	ARG="$1"

	#if [[ $ARG =~ ^-vv* ]]; then

		if [ "$ARG" = "-v" ]; then
			VERBOSE="info";
		elif [ "$ARG" = "--verbose" ]; then
			VERBOSE="info";
		elif [ "$ARG" = "-vv" ]; then
			VERBOSE="debug";
		elif [ "$ARG" = "-vvv" ]; then
			VERBOSE="trace"
		elif [ "$ARG" = "-vvvv" ]; then
			VERBOSE="trace"
		elif [ "$ARG" = "-vvvvv" ]; then
			VERBOSE="trace"
		elif [ "$ARG" = "-vvvvvv" ]; then
			VERBOSE="trace"
		else
			case "$ARG" in 
				("-D"*)   java_args="${java_args} $ARG";; 
				(*)       CMD_LINE="${CMD_LINE} ${ARG}";;
			esac
		fi
	#else
		#CMD_LINE="${CMD_LINE} ${ARG}"
	#fi

	shift
done

#echo verbose : $VERBOSE
#echo cmd line: $CMD_LINE

if [  "${VERBOSE}" != "" ]; then
	#CMD_LINE="java_args=-Dorg.slf4j.simpleLogger.defaultLogLevel=${VERBOSE} ${CMD_LINE} ${java_args}"
	java_args="-Dorg.slf4j.simpleLogger.defaultLogLevel=${VERBOSE} ${java_args}"
fi

#echo cmd line: $CMD_LINE

#exec "$java" $java_args -jar $MYSELF "$@"

exec "$java" $java_args -jar $MYSELF $CMD_LINE
exit 1 
