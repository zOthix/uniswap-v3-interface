#!/bin/bash

start_time=$(date +%s)

source "${PWD}/post_install_scripts/files_containing_chainIds.sh"

escape_special_chars() {
    echo "$1" | sed 's/[^^]/[&]/g; s/\^/\\^/g'
}

PATTERN_1_="'10': { isActive"
PATTERN_2_="chainId: 10,"
PATTERN_3_="chain_10"
PATTERN_4_="[\"OPTIMISM\"] = 10]"
PATTERN_5_="OPTIMISM = 10,"
PATTERN_6_="\"10\": {"
PATTERN_7_="_WETH[10]"
PATTERN_8_="[10]: new"
PATTERN_9_="[10]=new"
PATTERN_10_="_CHAIN_CONFIGS[10]"
PATTERN_11_="[10]: {"
PATTERN_12_="Token(10,"
PATTERN_13_="OPTIMISM=10]"
PATTERN_14_="10?: {"
PATTERN_15_="case 10:"
PATTERN_16_="chainId:10"
PATTERN_17_="id: 10,"
PATTERN_18_="NUMBER_10"

PATTERN_1="'11155420': { isActive"
PATTERN_2="chainId: 11155420,"
PATTERN_3="chain_11155420"
PATTERN_4="[\"OPTIMISM\"] = 11155420]"
PATTERN_5="OPTIMISM = 11155420,"
PATTERN_6="\"11155420\": {"
PATTERN_7="_WETH[11155420]"
PATTERN_8="[11155420]: new"
PATTERN_9="[11155420]=new"
PATTERN_10="_CHAIN_CONFIGS[11155420]"
PATTERN_11="[11155420]: {"
PATTERN_12="Token(11155420,"
PATTERN_13="OPTIMISM=11155420]"
PATTERN_14="11155420?: {"
PATTERN_15="case 11155420:"
PATTERN_16="chainId:11155420"
PATTERN_17="id: 11155420,"
PATTERN_18="NUMBER_11155420"


for FILE in "${FILES[@]}"; do
    sed -i \
    -e "s|$(escape_special_chars "$PATTERN_1_")|$PATTERN_1|gi" \
    -e "s|$(escape_special_chars "$PATTERN_2_")|$PATTERN_2|gi" \
    -e "s|$(escape_special_chars "$PATTERN_3_")|$PATTERN_3|gi" \
    -e "s|$(escape_special_chars "$PATTERN_4_")|$PATTERN_4|gi" \
    -e "s|$(escape_special_chars "$PATTERN_5_")|$PATTERN_5|gi" \
    -e "s|$(escape_special_chars "$PATTERN_6_")|$PATTERN_6|gi" \
    -e "s|$(escape_special_chars "$PATTERN_7_")|$PATTERN_7|gi" \
    -e "s|$(escape_special_chars "$PATTERN_8_")|$PATTERN_8|gi" \
    -e "s|$(escape_special_chars "$PATTERN_9_")|$PATTERN_9|gi" \
    -e "s|$(escape_special_chars "$PATTERN_10_")|$PATTERN_10|gi" \
    -e "s|$(escape_special_chars "$PATTERN_11_")|$PATTERN_11|gi" \
    -e "s|$(escape_special_chars "$PATTERN_12_")|$PATTERN_12|gi" \
    -e "s|$(escape_special_chars "$PATTERN_13_")|$PATTERN_13|gi" \
    -e "s|$(escape_special_chars "$PATTERN_14_")|$PATTERN_14|gi" \
    -e "s|$(escape_special_chars "$PATTERN_15_")|$PATTERN_15|gi" \
    -e "s|$(escape_special_chars "$PATTERN_16_")|$PATTERN_16|gi" \
    -e "s|$(escape_special_chars "$PATTERN_17_")|$PATTERN_17|gi" \
    -e "s|$(escape_special_chars "$PATTERN_18_")|$PATTERN_18|gi" \
    "$FILE"
done

end_time=$(date +%s)
time_taken=$((end_time - start_time))
echo "Time taken: $time_taken seconds"
