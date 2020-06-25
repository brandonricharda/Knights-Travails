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

    #breadth_first method works – need to refactor so that it accepts start and end points then finds the shortest path between them

    def breadth_first
        visited = []
        q = []
        q << @list.keys[0]

        #I need to update this until loop so that it recognizes when the last visited element is in the last column
        #from there it needs to jump down and loop backwards across that row, etc
        #this will allow it to cover all scenarios when we allow the method to accept start and end points
        
        until q.empty?
            visited << q.shift unless visited.include?(q.first)
            @list[visited.last].each do |adj|
                next if visited.include?(adj) || q.include?(adj)
                q << adj
            end
        end

        p visited

    end

end

test = Board.new(8)

test.breadth_first