#!/bin/bash
# ./test-wrapper.sh $title $duration [$exit_code]

# Pretend test harness...
fail=${3:0}

echo "spinnaker-demo test: $1"
echo "  $1 requires $2 seconds to complete."
sleep $2
echo "  Finished $1, resulting exit code: $fail"
exit $fail
