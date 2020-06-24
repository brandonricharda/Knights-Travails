class Vertex

    attr_accessor :data, :adjacent

    def initialize(value)
        @data = value
        @adjacent = []
    end

end

class Board

    attr_accessor :list, :arr, :vertices

    def initialize(value)

        @value = value
        @list = {}
        @arr = []
        @vertices = []
        0.upto(@value - 1) { |num| @arr << num }
        
        @arr.each do |row|
            @arr.each do |col|
                @vertices << Vertex.new([row, col])
            end
        end

        @vertices.each_with_index do |vertex, index|
            #these lines add the node's, predecessor, successor, or underling, respectively
            #as long as those items exist and do not "wrap around" the board
            vertex.adjacent << @vertices[index - 1].data unless index == 0 || @vertices[index - 1].data[0] != vertex.data[0]
            vertex.adjacent << @vertices[index + 1].data unless !@vertices[index + 1] || @vertices[index + 1].data[1] == 0
            vertex.adjacent << @vertices[index + @value].data unless !@vertices[index + @value]
            @list[vertex.data] = vertex.adjacent
        end

    end

    #breadth_first method works – need to refactor
    #so that it accepts start and end points
    #then finds the shortest path between them

    def breadth_first
        visited = []
        q = []
        q << @list.keys[0]
        
        until q.empty?
            visited << q.shift unless visited.include?(q.first)
            @list[visited.last].each do |adj|
                q << adj unless visited.include?(adj) || q.include?(adj)
            end
        end

        p visited

    end

end

test = Board.new(8)

test.breadth_first