-- DymoApiIntroduction SDK error

local DymoApiIntroductionError = {}
DymoApiIntroductionError.__index = DymoApiIntroductionError


function DymoApiIntroductionError.new(code, msg, ctx)
  local self = setmetatable({}, DymoApiIntroductionError)
  self.is_sdk_error = true
  self.sdk = "DymoApiIntroduction"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function DymoApiIntroductionError:error()
  return self.msg
end


function DymoApiIntroductionError:__tostring()
  return self.msg
end


return DymoApiIntroductionError
