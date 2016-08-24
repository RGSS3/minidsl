module Minidsl
  class Proxy < BasicObject
    def initialize(obj)
      @obj = obj
    end

    def method_missing(sym, *args)
      @obj.pure(sym).call(*args)
    end
  end
end