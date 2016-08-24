module Minidsl
    class Scope
        class Statements < Scope
            def initialize(list = [])
                @list = list
            end

            def from(obj)
                @list.delete_if{|x| x.object_id == obj.object_id }
                obj
            end

            def prebind(obj)
                @list.concat Array(obj)
                obj
            end

            def ret(obj)
                obj
            end

            def result
                @list
            end
        end
    end
end
