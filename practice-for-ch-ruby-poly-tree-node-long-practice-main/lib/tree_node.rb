require "byebug"
class PolyTreeNode

    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if self.parent != nil 
            self.parent.children.delete(self)
        end
        @parent = node # first parent
        
        if @parent != nil
            node.children << self if !node.children.include?(self)
        end

    end 

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        raise "error!" if !child.value.include?("child")
    end


    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            res = child.dfs(target)
            return res if res != nil
        end 

        nil

    end

    def bfs(target)
        array = []
        array << self
        while array.length > 0
            curr = array.shift
            if curr.value == target
                return curr
            else
                array += curr.children
            end
        end
        nil
    end 






end