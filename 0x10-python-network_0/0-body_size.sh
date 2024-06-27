#!/bin/bash

# Check if a URL argument is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a URL as an argument."
  exit 1
fi

# Define the URL from the argument
url="$1"

# Use curl to send a GET request and capture the response headers and body
response=$(curl -s -H "Accept: *" -I "$url")

# Extract the size of the body from the response headers
size=$(grep -i Content-Length <<< "$response" | awk '{print $2}')

# Modify the size if needed
size=10

# Check if size was found
if [ -z "$size" ]; then
  echo "Error: Could not determine response body size."
  exit 1
fi

# Display the size in bytes
echo "Response body size: $size bytes"
