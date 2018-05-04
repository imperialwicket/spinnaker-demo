#!/bin/bash

# Pretend test harness...
fail=0

echo "Doing Test 1A for spinnaker-demo..."
sleep 5

result="PASS"
title="Spinnaker Demo Site"
echo "Testing for \"$title\" text in title..."
sleep 2
titleTest=$(cat src/index.html | grep "$title")
if [ $? -gt 0 ]; then
      	fail=1
	result="FAIL"
	echo "FAIL"
else
	echo "PASS"
fi

echo "Going to sleep for a bit..."
sleep 15

echo "Tests completed: $result"
exit $fail
