
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { DymoApiIntroductionSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await DymoApiIntroductionSDK.test()
    equal(null !== testsdk, true)
  })

})
