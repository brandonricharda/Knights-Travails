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
        @arr = (0..7).to_a
        @vertices = []
        
        @arr.each do |row|
            @arr.each do |col|
                @vertices << Vertex.new([row, col])
            end
        end

        @res = []

        @vertices.each_with_index do |vertex, index|

            @vertices.each do |adj|

                #I believe I solved it – just need to double check and ensure

                height_diff = (adj.data[0] - vertex.data[0]).abs
                width_diff = (adj.data[1] - vertex.data[1]).abs

                if height_diff + width_diff == 3
                    vertex.adjacent << adj.data if height_diff == 1 || width_diff == 1
                end

            end

            @list[vertex.data] = vertex.adjacent

        end

    end

    def find_vertex(value)
        
        pointer = @vertices[0]
        counter = 0

        until pointer.data == value
            item = @vertices[counter]
            counter += 1
        end

        pointer

    end

    #the find_path algorithm needs to be overhauled completely once we reconfigure the board setup
    #to accomodate for the knight's movement pattern

    # def find_path(first, last)

    #     visited = []
    #     q = []
    #     q << first

    #     until visited.last && visited.last[1] == last[1]
    #         visited << q.shift unless visited.include?(q.first)
    #         @list[visited.last].each do |adj|
    #             next if visited.include?(adj) || q.include?(adj)
    #             q << adj if q.empty? || @list[q.last].include?(adj)
    #         end
    #     end

    #     q.clear

    #     q << @list[visited.last].select { |vertex| (vertex[0] - last[0]).abs < (visited.last[0] - last[0]).abs }.first

    #     until visited.last == last
    #         visited << q.shift unless visited.include?(q.first)
    #         return visited if visited.last == last
    #         @list[visited.last].each do |adj|
    #             next if visited.include?(adj) || q.include?(adj)
    #             q << adj if (adj[0] - last[0]).abs < (visited.last[0] - last[0]).abs
    #         end
    #     end

    #     visited

    # end

end

test = Board.new

p test.list