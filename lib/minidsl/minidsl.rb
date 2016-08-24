require 'minidsl/proxy'
module Minidsl
  def pure(met)
    real_method = method(met)
    lambda{|*a| 
      from self
      args = a.map{|x| from x}
      ret real_method.call(*args)
    }
  end

  def pure_proxy(obj)
    Proxy.new obj
  end

  def from(obj)
      Scope.from obj
  end

  def ret(obj)
      Scope.ret obj
  end
end