#!/bin/bash

start_time=$(date +%s)

echo "replacing addresses..."

source "${PWD}/post_install_scripts/files_containing_addresses.sh"

escape_special_chars() {
    echo "$1" | sed 's/[^^]/[&]/g; s/\^/\\^/g'
}

# DEFAULT OPTMISM ADDRESSES
WETH_ADDRESS_="0x4200000000000000000000000000000000000006"
USDC_ADDRESS_="0x0b2C639c533813f4Aa9D7837CAf62653d097Ff85"
USDT_ADDRESS_="0x94b008aA00579c1307B0EF2c499aD98a8ce58e58"
WBTC_ADDRESS_="0x68f180fcCe6836688e9084f035309E29Bf0A2095"
DAI_ADDRESS_="0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1"
USDC_OPTIMISM_MIGRATION3_="0x7F5c764cBc14f9669B88837ca1490cCa17c31607"
FACTORY_ADDRESS_="0x1F98431c8aD98523631AE4a59f267346ea31F984"
UNIVERSAL_ROUTER_ADDRESS_1="0x0c3c1c532F1e39EdF36BE9Fe0bE1410313E074Bf"
UNIVERSAL_ROUTER_ADDRESS_2="0xCb1355ff08Ab38bBCE60111F1bb2B784bE25D7e8"
UNIVERSAL_ROUTER_ADDRESS_3="0xeC8B0F7Ffe3ae75d7FfAb09429e3675bb63503e4"
SWAP_ROUTER_ADDRESS_="0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45"
NFT_DESCRIPTOR_ADDRESS_="0x42B24A95702b9986e82d421cC3568932790A48Ec"
POSITION_DESCRIPTOR_ADDRESS_="0x91ae842A5Ffd8d12023116943e72A606179294f3"
POSITION_MANAGER_ADDRESS_="0xC36442b4a4522E871399CD717aBDD847Ab11FE88"
MULTICALL_ADDRESS_="0x1F98415757620B543A52E61c46B32eB19261F984"
QUOTER_ADDRESS_="0x61fFE014bA17989E743c5F6cB21bF9697530B21e"
V3_MIGRATOR_ADDRESS_="0xA5644E29708357803b5A882D272c41cC0dF92B34"
TICK_LENS_ADDRESS_="0xbfd8137f7d1516D3ea5cA83523914859ec47F573"
SUBGRAPH_URL_="https://api.thegraph.com/subgraphs/name/ianlapham/optimism-post-regenesis"
RPC_URL_="https://mainnet.optimism.io"
SOURCE_MAP_PATTERN_="let mappingsWasmUrl = null"

# ADDRESSES TO REPLACE WITH
WETH_ADDRESS=""
USDC_ADDRESS=""
USDT_ADDRESS=""
WBTC_ADDRESS=""
DAI_ADDRESS=""
FACTORY_ADDRESS=""
SWAP_ROUTER_ADDRESS=""
NFT_DESCRIPTOR_ADDRESS=""
POSITION_DESCRIPTOR_ADDRESS=""
POSITION_MANAGER_ADDRESS=""
MULTICALL_ADDRESS=""
QUOTER_ADDRESS=""
V3_MIGRATOR_ADDRESS=""
TICK_LENS_ADDRESS=""
SUBGRAPH_URL=""
RPC_URL=""
SOURCE_MAP_PATTERN="let mappingsWasmUrl = \"https://unpkg.com/source-map@0.7.3/lib/mappings.wasm\""

for FILE in "${FILES[@]}"; do
    sed -i \
    -e "s|$(escape_special_chars "$WETH_ADDRESS_")|$WETH_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$USDC_ADDRESS_")|$USDC_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$USDT_ADDRESS_")|$USDT_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$WBTC_ADDRESS_")|$WBTC_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$DAI_ADDRESS_")|$DAI_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$USDC_OPTIMISM_MIGRATION3_")|$USDC_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$FACTORY_ADDRESS_")|$FACTORY_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$SWAP_ROUTER_ADDRESS_")|$SWAP_ROUTER_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$UNIVERSAL_ROUTER_ADDRESS_1")|$SWAP_ROUTER_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$UNIVERSAL_ROUTER_ADDRESS_2")|$SWAP_ROUTER_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$UNIVERSAL_ROUTER_ADDRESS_3")|$SWAP_ROUTER_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$NFT_DESCRIPTOR_ADDRESS_")|$NFT_DESCRIPTOR_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$POSITION_DESCRIPTOR_ADDRESS_")|$POSITION_DESCRIPTOR_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$POSITION_MANAGER_ADDRESS_")|$POSITION_MANAGER_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$MULTICALL_ADDRESS_")|$MULTICALL_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$QUOTER_ADDRESS_")|$QUOTER_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$V3_MIGRATOR_ADDRESS_")|$V3_MIGRATOR_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$TICK_LENS_ADDRESS_")|$TICK_LENS_ADDRESS|gi" \
    -e "s|$(escape_special_chars "$SUBGRAPH_URL_")|$SUBGRAPH_URL|gi" \
    -e "s|$(escape_special_chars "$RPC_URL_")|$RPC_URL|gi" \
    -e "s|$(escape_special_chars "$SOURCE_MAP_PATTERN_")|$SOURCE_MAP_PATTERN|gi" \
    "$FILE"
done

BASEURL_="https://api.uniswap.org/v1/"
BASEURL="https://q80a8rx8l9.execute-api.eu-west-1.amazonaws.com/prod/"
FILE_PATH="src/state/routing/slice.ts"
# replace base URL
sed -i "s|$(escape_special_chars "$BASEURL_")|$BASEURL|gi" "$FILE_PATH"
end_time=$(date +%s)
time_taken=$((end_time - start_time))
echo "Time taken: $time_taken seconds"
