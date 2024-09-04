#!/bin/bash
#juanTM


# Run each testing file and print the result
echo "Running tests..."

for file in test_*.py; do
  echo "Testing $file..."
  python $file
  if [ $? -eq 0 ]; then
    echo "PASS: $file"
  else
    echo "FAIL: $file"
  fi
done

echo "All tests complete."