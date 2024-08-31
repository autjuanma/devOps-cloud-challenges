#!/bin/bash
# Author information
AUTHOR="[JuanTM 📲]"
EMAIL="juannodecoorp@gmail.com"
DATE="2024-30-24"

# Count the occurrences of each IP address
count_ips() {
  cat ip_list | awk '{print $1}' | sort | uniq -c | sort -rn
}

# Get the most recurring IP address
most_recurring_ip=$(count_ips | head -1 | awk '{print $2}')

# Print the result
echo "The most recurring IP address is: $most_recurring_ip"
