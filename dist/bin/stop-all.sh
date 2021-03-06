#!/usr/bin/env sh

# PredictionIO Shutdown Script

# Get the absolute path of the build script
SCRIPT="$0"
while [ -h "$SCRIPT" ] ; do
	SCRIPT=`readlink "$SCRIPT"`
done

# Get the base directory of the repo
DIR=`dirname $SCRIPT`/..
cd $DIR
BASE=`pwd`

. "$BASE/bin/common.sh"

# Admin server
$BASE/bin/stop-admin.sh

# API server
$BASE/bin/stop-api.sh

# Scheduler server
$BASE/bin/stop-scheduler.sh

echo ""
echo "Note: You must stop any running MongoDB/Hadoop processes manually"
