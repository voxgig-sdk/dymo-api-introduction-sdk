# DymoApiIntroduction SDK exists test

require "minitest/autorun"
require_relative "../DymoApiIntroduction_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = DymoApiIntroductionSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
