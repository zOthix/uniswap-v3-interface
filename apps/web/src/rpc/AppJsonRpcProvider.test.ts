import { TransactionResponse } from '@ethersproject/abstract-provider'
import { JsonRpcProvider, Network, Provider } from '@ethersproject/providers'
import { ChainId } from '@uniswap/sdk-core'

import AppJsonRpcProvider from './AppJsonRpcProvider'

jest.mock('@ethersproject/providers')

describe('AppJsonRpcProvider', () => {
  beforeEach(() => {
    jest.useFakeTimers()
  })
  afterEach(() => {
    jest.useRealTimers()
  })

  let mockProviders: JsonRpcProvider[]
  let mockProvider1: jest.Mocked<JsonRpcProvider>
  let mockProvider2: jest.Mocked<JsonRpcProvider>
  let mockIsProvider: jest.SpyInstance

  beforeEach(() => {
    mockProvider1 = new JsonRpcProvider() as jest.Mocked<JsonRpcProvider>
    mockProvider2 = new JsonRpcProvider() as jest.Mocked<JsonRpcProvider>

    mockIsProvider = jest.spyOn(Provider, 'isProvider').mockReturnValue(true)
    mockProviders = [mockProvider1, mockProvider2]
    mockProviders.forEach((provider) => {
      // override readonly property
      // @ts-expect-error
      provider.network = {
        name: 'homestead',
        chainId: 1,
      } as Network
      provider.getNetwork = jest.fn().mockReturnValue({
        name: 'homestead',
        chainId: 1,
      } as Network)
      // override readonly property
      // @ts-expect-error
      provider.connection = { url: '' }
    })
  })

  it('should sort faster providers before slower providers', async () => {
    // Validate that the providers are sorted correctly by latency
    const [fastProvider, slowProvider] = AppJsonRpcProvider.sortProviders([
      { provider: {} as JsonRpcProvider, performance: { latency: 500, callCount: 1, failureCount: 0 } },
      { provider: {} as JsonRpcProvider, performance: { latency: 1, callCount: 1, failureCount: 0 } },
    ])

    expect(fastProvider.performance.latency).toBeLessThan(slowProvider.performance.latency)
  })

  it('should sort failing providers after successful providers', async () => {
    // Validate that the providers are sorted correctly by failure rate
    const [provider, failingProvider] = AppJsonRpcProvider.sortProviders([
      { provider: {} as JsonRpcProvider, performance: { latency: 1, callCount: 1, failureCount: 1 } },
      { provider: {} as JsonRpcProvider, performance: { latency: 1, callCount: 1, failureCount: 0 } },
    ])

    expect(provider.performance.failureCount).toBeLessThan(failingProvider.performance.failureCount)
  })
})
