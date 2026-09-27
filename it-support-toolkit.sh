#!/bin/bash

# Mac IT Support Troubleshooting Toolkit
# Author: Your Name
# Purpose: Run basic first-line IT support diagnostics

REPORT="support-report-$(date '+%Y-%m-%d-%H%M%S').txt"

echo "======================================"
echo "     MAC IT SUPPORT TOOLKIT"
echo "======================================"
echo ""

{
echo "MAC IT SUPPORT TROUBLESHOOTING REPORT"
echo "Generated: $(date)"
echo "======================================"
echo ""

echo "1. SYSTEM INFORMATION"
echo "--------------------------------------"
system_profiler SPHardwareDataType | grep -E "Model Name|Model Identifier|Chip|Memory"

echo ""
echo "2. MACOS VERSION"
echo "--------------------------------------"
sw_vers

echo ""
echo "3. DISK SPACE"
echo "--------------------------------------"
df -h /

echo ""
echo "4. NETWORK INFORMATION"
echo "--------------------------------------"
ifconfig | grep -E "^[a-z]|inet "

echo ""
echo "5. INTERNET CONNECTIVITY"
echo "--------------------------------------"

if ping -c 4 8.8.8.8 > /dev/null 2>&1
then
    echo "Internet connection: OK"
else
    echo "Internet connection: FAILED"
fi

echo ""
echo "6. DNS TEST"
echo "--------------------------------------"

if ping -c 4 google.com > /dev/null 2>&1
then
    echo "DNS resolution: OK"
else
    echo "DNS resolution: FAILED"
fi

echo ""
echo "7. TROUBLESHOOTING SUMMARY"
echo "--------------------------------------"
echo "Basic system, storage, network, internet and DNS checks completed."

echo ""
echo "======================================"
echo "       TROUBLESHOOTING COMPLETE"
echo "======================================"

} | tee "$REPORT"

echo ""
echo "Report saved to:"
echo "$REPORT"
