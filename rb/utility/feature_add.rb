# DymoApiIntroduction SDK utility: feature_add
module DymoApiIntroductionUtilities
  FeatureAdd = ->(ctx, f) {
    ctx.client.features << f
  }
end
