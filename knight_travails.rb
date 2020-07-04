class Vertex

    attr_accessor :data, :adjacent

    def initialize(value)
        @data = value
        @adjacent = []
    end

end

class Board

    attr_accessor :list, :arr, :vertices

    def initialize

        @list = {}
        #sets the board up to be 8 x 8
        @arr = (0..7).to_a
        @vertices = []
        @legal_move = {
            #specifies the legal move for the chess piece (knight)
            #knight moves a total of three squares each time
            :total_squares => 3,
            #each move is L-shaped – two squares at the longest end and one at the shortest
            :longest_part => 2,
            :shortest_part => 1
        }
        
        @arr.each do |row|
            @arr.each do |col|
                @vertices << Vertex.new([row, col])
            end
        end

        @res = []

        @vertices.each_with_index do |vertex, index|

            @vertices.each do |adj|

                height_diff = (adj.data[0] - vertex.data[0]).abs
                width_diff = (adj.data[1] - vertex.data[1]).abs

                if height_diff + width_diff == @legal_move[:total_squares]
                    vertex.adjacent << adj.data if height_diff == @legal_move[:shortest_part] || width_diff == @legal_move[:shortest_part]
                end

            end

            @list[vertex.data] = vertex.adjacent

        end

    end

    #method works – just need to clean the code up a little bit

    def breadth_first(first)
        visited = []
        q = []
        q << first
        prev = {}

        until q.empty?
            visited << q.shift unless visited.include?(q.first)
            @list[visited.last].each do |adj|
                unless q.include?(adj) || visited.include?(adj)
                    q << adj
                    prev[adj] = visited.last
                end
            end
        end

        prev

    end

    def find_path(first, last)

        prev = breadth_first(first)
        result = []
        result << last

        until result.last == first
            result << prev[result.last]
        end

        result.reverse

    end

end

test = Board.new

keys = test.list.keys

#demonstrates the find_path method for first vertex to every other vertex in the graph

keys.each do |item|

    p test.find_path(keys.first, item)

end