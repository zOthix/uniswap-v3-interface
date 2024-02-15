#!/bin/bash

start_time=$(date +%s)

PATTERNS=(
   # DEFAULT OPTMISM ADDRESSES
    "0x4200000000000000000000000000000000000006" # WETH_ADDRESS
    "0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85" # USDC_ADDRESS
    "0x94b008aA00579c1307B0EF2c499aD98a8ce58e58" # USDT_ADDRESS
    "0x68f180fcCe6836688e9084f035309E29Bf0A2095" # WBTC_ADDRESS
    "0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1" # DAI_ADDRESS
    "0x7F5c764cBc14f9669B88837ca1490cCa17c31607" # USDC_OPTIMISM_MIGRATION3
    "0x1F98431c8aD98523631AE4a59f267346ea31F984" # FACTORY_ADDRESS
    "0x0c3c1c532F1e39EdF36BE9Fe0bE1410313E074Bf" # UNIVERSAL ROUTER ADDRESS
    "0xCb1355ff08Ab38bBCE60111F1bb2B784bE25D7e8" # UNIVERSAL ROUTER ADDRESS 2
    "0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45" # SWAP_ROUTER_ADDRESS
    "0x42B24A95702b9986e82d421cC3568932790A48Ec" # NFT_DESCRIPTOR_ADDRESS
    "0x91ae842A5Ffd8d12023116943e72A606179294f3" # POSITION_DESCRIPTOR_ADDRESS
    "0xC36442b4a4522E871399CD717aBDD847Ab11FE88" # POSITION_MANAGER_ADDRESS
    "0x1F98415757620B543A52E61c46B32eB19261F984" # MULTICALL_ADDRESS
    "0x61fFE014bA17989E743c5F6cB21bF9697530B21e" # QUOTER_ADDRESS
    "0xA5644E29708357803b5A882D272c41cC0dF92B34" # V3_MIGRATOR_ADDRESS
    "0xbfd8137f7d1516D3ea5cA83523914859ec47F573" # TICK_LENS_ADDRESS
    "https://api.thegraph.com/subgraphs/name/ianlapham/optimism-post-regenesis" # SUBGRAPH URL
    "https://mainnet.optimism.io" # RPC URL
)


declare -a UNIQUE_FILES

for PATTERN in "${PATTERNS[@]}"; do
    while IFS= read -r file; do
        UNIQUE_FILES+=("$file")
    done < <(grep -iRl --exclude-dir=post_install_scripts "$PATTERN" ./)
done

# Sort the array and remove duplicates
IFS=$'\n' sorted_unique_files=($(sort -u <<<"${UNIQUE_FILES[*]}"))
unset IFS

# Write to the output file
output_file="post_install_scripts/files_containing_addresses.sh"
echo "FILES=(" > "$output_file"
for file in "${sorted_unique_files[@]}"; do
    echo "    \"$file\"" >> "$output_file"
done
echo ")" >> "$output_file"


end_time=$(date +%s)
time_taken=$((end_time - start_time))
echo "Time taken: $time_taken seconds"