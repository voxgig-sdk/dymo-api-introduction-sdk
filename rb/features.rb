# DymoApiIntroduction SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module DymoApiIntroductionFeatures
  def self.make_feature(name)
    case name
    when "base"
      DymoApiIntroductionBaseFeature.new
    when "test"
      DymoApiIntroductionTestFeature.new
    else
      DymoApiIntroductionBaseFeature.new
    end
  end
end
