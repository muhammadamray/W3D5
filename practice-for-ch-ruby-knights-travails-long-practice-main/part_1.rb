require_relative "tree_node"

class KnightPathFinder

    attr_reader :root_node
    MOVES = [
        [-2,-1],
        [-2,1],
        [-1,-2],
        [-1,2],
        [1,-2],
        [1,2],
        [2,-1],
        [2,1]
    ]

    def self.valid_moves(position)
        valid = []
        current_x, current_y = positions
        MOVES.each do |(dx, dy)|
            new_position = [(current_x + dx), (current_y + dy)]
            valid << new_position if new_position.all? {|coord| coord.between? (0, 7)}
        end 
    end

    def initialize(position) # [a, b]
        @root_node = position
        @considered_positions = [start_pos]

        build_move_tree
    end

    sttr_accesor :root_node, :considered_positions

    def build_move_tree
        self.root_node = PolyTreeNode.new(start_pos)

        nodes = [root_node]
        until nodes.empty? 
            current_node = nodes.shift 

            current_pos = current_node.value
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end 
        end 
    end 
    
            
        






    end
end