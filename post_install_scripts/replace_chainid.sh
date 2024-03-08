#!/bin/bash

start_time=$(date +%s)

echo "replacing chainId..."

source "${PWD}/post_install_scripts/files_containing_chainIds.sh"

escape_special_chars() {
    echo "$1" | sed 's/[^^]/[&]/g; s/\^/\\^/g'
}

CHAIN_ID_=10
PATTERN_1_="'$CHAIN_ID_': { isActive"
PATTERN_2_="chainId: $CHAIN_ID_,"
PATTERN_3_="chain_$CHAIN_ID_"
PATTERN_4_="[\"OPTIMISM\"] = $CHAIN_ID_]"
PATTERN_5_="OPTIMISM = $CHAIN_ID_,"
PATTERN_6_="\"$CHAIN_ID_\": {"
PATTERN_7_="_WETH[$CHAIN_ID_]"
PATTERN_8_="[$CHAIN_ID_]: new"
PATTERN_9_="[$CHAIN_ID_]=new"
PATTERN_10_="_CHAIN_CONFIGS[$CHAIN_ID_]"
PATTERN_11_="[$CHAIN_ID_]: {"
PATTERN_12_="Token($CHAIN_ID_,"
PATTERN_13_="OPTIMISM=$CHAIN_ID_]"
PATTERN_14_="$CHAIN_ID_?: {"
PATTERN_15_="case $CHAIN_ID_:"
PATTERN_16_="chainId:$CHAIN_ID_"
PATTERN_17_="id: $CHAIN_ID_,"
PATTERN_18_="NUMBER_$CHAIN_ID_"
PATTERN_19_="networkId: $CHAIN_ID_,"
PATTERN_20_="WEB3_RPC_$CHAIN_ID_"
PATTERN_21_="JSON_RPC_PROVIDER_$CHAIN_ID_"
PATTERN_23_="OPTIMISM = $CHAIN_ID_]"
PATTERN_24_="[$CHAIN_ID_]: new Token($CHAIN_ID_,"
PATTERN_25_="pe[$CHAIN_ID_] = new le($CHAIN_ID_,"
PATTERN_26_="[$CHAIN_ID_]={"
PATTERN_27_="$CHAIN_ID_: '0"
PATTERN_28_="$CHAIN_ID_:\"0"
PATTERN_29_="C[$CHAIN_ID_]="

CHAIN_ID=
PATTERN_1="'$CHAIN_ID': { isActive"
PATTERN_2="chainId: $CHAIN_ID,"
PATTERN_3="chain_$CHAIN_ID"
PATTERN_4="[\"OPTIMISM\"] = $CHAIN_ID]"
PATTERN_5="OPTIMISM = $CHAIN_ID,"
PATTERN_6="\"$CHAIN_ID\": {"
PATTERN_7="_WETH[$CHAIN_ID]"
PATTERN_8="[$CHAIN_ID]: new"
PATTERN_9="[$CHAIN_ID]=new"
PATTERN_10="_CHAIN_CONFIGS[$CHAIN_ID]"
PATTERN_11="[$CHAIN_ID]: {"
PATTERN_12="Token($CHAIN_ID,"
PATTERN_13="OPTIMISM=$CHAIN_ID]"
PATTERN_14="$CHAIN_ID?: {"
PATTERN_15="case $CHAIN_ID:"
PATTERN_16="chainId:$CHAIN_ID"
PATTERN_17="id: $CHAIN_ID,"
PATTERN_18="NUMBER_$CHAIN_ID"
PATTERN_19="networkId: $CHAIN_ID,"
PATTERN_20="WEB3_RPC_$CHAIN_ID"
PATTERN_21="JSON_RPC_PROVIDER_$CHAIN_ID"
PATTERN_23="OPTIMISM = $CHAIN_ID]"
PATTERN_24="[$CHAIN_ID]: new Token($CHAIN_ID,"
PATTERN_25="pe[$CHAIN_ID] = new le($CHAIN_ID,"
PATTERN_26="[$CHAIN_ID]={"
PATTERN_27="$CHAIN_ID: '0"
PATTERN_28="$CHAIN_ID:\"0"
PATTERN_29="C[$CHAIN_ID]="

# Remove the chain id if it exists already
PATTERN_0_="$CHAIN_ID"
PATTERN_0="1119991"

for FILE in "${FILES_CONTAINING_OUR_CHAIN_ID[@]}"; do
    sed -i \
    -e "s|$(escape_special_chars "$PATTERN_0_")|$PATTERN_0|gi" \
    "$FILE"
done

# Replace the OPTIMISM chain id with our chain id
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
    -e "s|$(escape_special_chars "$PATTERN_19_")|$PATTERN_19|gi" \
    -e "s|$(escape_special_chars "$PATTERN_20_")|$PATTERN_20|gi" \
    -e "s|$(escape_special_chars "$PATTERN_21_")|$PATTERN_21|gi" \
    -e "s|$(escape_special_chars "$PATTERN_23_")|$PATTERN_23|gi" \
    -e "s|$(escape_special_chars "$PATTERN_24_")|$PATTERN_24|gi" \
    -e "s|$(escape_special_chars "$PATTERN_25_")|$PATTERN_25|gi" \
    -e "s|$(escape_special_chars "$PATTERN_26_")|$PATTERN_26|gi" \
    -e "s|$(escape_special_chars "$PATTERN_27_")|$PATTERN_27|gi" \
    -e "s|$(escape_special_chars "$PATTERN_28_")|$PATTERN_28|gi" \
    -e "s|$(escape_special_chars "$PATTERN_29_")|$PATTERN_29|gi" \
    "$FILE"
done

end_time=$(date +%s)
time_taken=$((end_time - start_time))
echo "Time taken: $time_taken seconds"
