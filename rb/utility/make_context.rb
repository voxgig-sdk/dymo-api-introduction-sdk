# DymoApiIntroduction SDK utility: make_context
require_relative '../core/context'
module DymoApiIntroductionUtilities
  MakeContext = ->(ctxmap, basectx) {
    DymoApiIntroductionContext.new(ctxmap, basectx)
  }
end
