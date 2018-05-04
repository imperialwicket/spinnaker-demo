#!/bin/bash

# Pretend test harness...
fail=0

echo "Doing some testing for spinnaker-demo..."
sleep 5

result="PASS"
versionText="VERSION"
echo "Testing for \"$versionText\" placeholder text in index.html..."
sleep 2
versionTest=$(cat src/index.html | grep "$verstionText")
if [ $? -gt 0 ]; then
	fail=1
	result="FAIL"
	echo "FAIL"
else
	echo "PASS"
fi
echo "Going to sleep for a bit..."
sleep 30

echo "Tests completed: $result"
exit $fail
