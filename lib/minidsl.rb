require "minidsl/version"

module Minidsl
  def liftA(met)
    recv, real_method = case met
                  when Symbol then [self, method(met)]
                  when Method then [met.receiver, met]
                  else [nil, met]
                  end
    if recv
      lambda{|*a| 
        args = a.map{|x| from(x)} # a <- , b <- ...
        from recv # recv <- 
        ret real_method.call(*args)
      }  
    else
      lambda{|*a| 
        args = a.map{|x| from(x)}
        ret real_method.call(*args)
      }
    end
  end
end

