module Minidsl
    class Scope
     attr_accessor :parent
     SCOPE = []
     def self.top
       SCOPE[-1]
     end

     def self.push(obj)
       obj.parent = top if !obj.parent
       SCOPE.push obj
       obj
     end

     def self.pop
       SCOPE.pop
     end

     def self.from(obj)
       top.from obj
     end

     def self.ret(obj)
       top.ret obj
     end
  end
end