$: << "lib"
require 'minidsl'

include Minidsl
r = Scope.push_context :List


class Test
   def int(opt = {})
      opt.map{|k, v|
         "int #{k} = #{v};"
      }
   end
   def println(str)
     "System.out.println(#{str.inspect});"
   end
end

s = pure_proxy Test.new
s.instance_eval{
  int a: 3, b: 5
  println "Hello world"
}

puts r.result
