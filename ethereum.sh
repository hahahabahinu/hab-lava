#!/bin/bash

RPC_URL="https://eth1.lava.build/lava-referer-960484cf-2746-4e74-85da-0b9d929dff45/"

OUTPUT_DIR="logs"

# Fetch Ethereum data
eth_data=$(curl -s -H "Content-type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_gasPrice","id":1}' "$RPC_URL")

# Check if the curl command was successful
if [ $? -eq 0 ]; then
    # Create the output directory if it doesn't exist
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    # Fetch the IP address of the GitHub runner
    runner_ip=$(curl -s https://api.ipify.org)
    
    # Save Ethereum data and runner IP address to the log file
    echo "Ethereum Data: $eth_data" >> "$OUTPUT_DIR/ethereum.txt"
    echo "Runner IP: $runner_ip" >> "$OUTPUT_DIR/ethereum.txt"
    
    echo "Ethereum data fetched and saved to $OUTPUT_DIR/ethereum.txt."
else
    echo "Failed to fetch Ethereum data."
fi
