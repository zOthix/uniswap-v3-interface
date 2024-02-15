#!/bin/bash
start_time=$(date +%s)

PATTERNS=(
    "'10': { isActive"
    "chainId: 10,"
    "chain_10"
    "[\"OPTIMISM\"] = 10]"
    "OPTIMISM = 10,"
    "\"10\": {"
    "_WETH[10]"
    "[10]: new"
    "[10]=new"
    "_CHAIN_CONFIGS[10]"
    "[10]: {"
    "Token(10,"
    "OPTIMISM=10]"
    "10?: {"
    "case 10:"
    "chainId:10"
    "id: 10,"
    "NUMBER_10"
    "networkId: 10,"
    "WEB3_RPC_10"
    "JSON_RPC_PROVIDER_10"
    "OPTIMISM = 10]"
    "[10]: new Token(10,"
    "pe[10] = new le(10,"
    "[10]={"
    "10: '0"
    "10:\"0"
)

declare -a UNIQUE_FILES

for PATTERN in "${PATTERNS[@]}"; do
    # Search in /node_modules/@uniswap
    while IFS= read -r file; do
        UNIQUE_FILES+=("$file")
    done < <(grep -iRl "$PATTERN" ./node_modules/@uniswap)

    # Search in other directories excluding node_modules
    while IFS= read -r file; do
        UNIQUE_FILES+=("$file")
        done < <(grep -iRl --exclude-dir={node_modules,post_install_scripts} "$PATTERN" ./)
done

# Sort the array and remove duplicates
IFS=$'\n' sorted_unique_files=($(sort -u <<<"${UNIQUE_FILES[*]}"))
unset IFS

# Write to the output file
output_file="post_install_scripts/files_containing_chainIds.sh"
echo "FILES=(" > "$output_file"
for file in "${sorted_unique_files[@]}"; do
    echo "    \"$file\"" >> "$output_file"
done
echo ")" >> "$output_file"


end_time=$(date +%s)
time_taken=$((end_time - start_time))
echo "Time taken: $time_taken seconds"