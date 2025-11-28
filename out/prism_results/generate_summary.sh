#!/bin/bash

cd /workspaces/csp2prism/out/prism_results

echo "LO-CoAP-EAP Parameter Sweep Results"
echo "===================================="
echo ""
echo "Parameter Configuration | Auth Success (min) | Auth Success (max) | Intruder MSK (min) | Intruder MSK (max) | Bytes Reward (min) | Bytes Reward (max)"
echo "---"

for log in locoap_pf*.log; do
    # Extract parameters
    p_flip=$(echo "$log" | sed 's/.*pf\([0-9.]*\)_pl.*/\1/')
    p_loss=$(echo "$log" | sed 's/.*pl\([0-9.]*\)\.log/\1/')
    
    # Extract first 10 Result lines
    results=$(grep "^Result:" "$log" | head -10 | awk '{print $2}' | tr '\n' ' ')
    
    echo "p_flip=$p_flip, p_loss=$p_loss | $results"
done

