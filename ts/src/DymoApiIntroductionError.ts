
import { Context } from './Context'


class DymoApiIntroductionError extends Error {

  isDymoApiIntroductionError = true

  sdk = 'DymoApiIntroduction'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  DymoApiIntroductionError
}

