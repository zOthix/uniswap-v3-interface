# UniswapV3 Interface Customization Documentation

This documentation provides step-by-step instructions on how to customize and run the UniswapV3 Interface for a specific blockchain network. The process involves replacing contract addresses and chain IDs to match the target blockchain.

## Prerequisites

- Node.js and npm must be installed on your system.
- Yarn package manager must be installed on your system.

## Setup Instructions

1. **Environment Setup**

   Begin by cloning the repository.

2. **Replace Contract Addresses**

   Modify the `replace_addresses.sh` script located in the post_install_scripts directory. Replace the placeholder contract addresses mentioned below with the deployed contract addresses for your target blockchain.

   ```shell
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
   SCAN_URL=""
   UNIVERSAL_ROUTER_ADDRESS=""
   ```

4. **Replace Chain ID**

   Modify the `replace_chainid.sh` script located in the post_install_scripts directory. Add the chain id in `CHAIN_ID` of your target blockchain.

   ```shell
   CHAIN_ID=
   ```

5. **Install dependencies**

   Run the following command to install project dependencies and execute post-install scripts to replace addresses and chain ID:

   ```shell
   yarn
   ```

6. **Prepare Project**

   ```shell
   yarn web prepare
   ```

7. **Start Project**

   **For Development**

   ```shell
   yarn web start
   ```

   **For Production**

   ```shell
   yarn web build:production
   yarn web serve
   ```

### Tested Environment

This customization has been tested for `Optimism Sepolia (L2)` network using the following environment:

- Node.js version: 20.2
- Yarn version: 3.6.3

### Conclusion

By following these steps, you should be able to customize and run the UniswapV3 Interface project for your blockchain network. This enables you to leverage Uniswap's decentralized exchange functionality within your custom environment.
