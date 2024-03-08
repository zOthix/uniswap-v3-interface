import { ChainId } from '@uniswap/sdk-core'
import { getChainInfo, NetworkType } from 'constants/chainInfo'
import { SupportedL2ChainId } from 'constants/chains'

export function isL2ChainId(chainId: number | undefined = ChainId.OPTIMISM): chainId is SupportedL2ChainId {
  const chainInfo = getChainInfo(chainId)
  return chainInfo?.networkType === NetworkType.L2
}
