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
        @grid = Array.new(8) {Array.new(8)}
    end

    def build_move_tree

    end
end