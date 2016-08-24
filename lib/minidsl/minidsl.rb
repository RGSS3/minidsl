module Minidsl
  def pure(met)
    real_method = method(met)
    lambda{|*a| 
      from self
      args = a.map{|x| from x}
      ret real_method.call(*args)
    }
  end
end