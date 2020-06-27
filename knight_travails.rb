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
            #these lines add the node's, predecessor, successor, top, or underling, respectively
            #as long as those items exist and do not "wrap around" the board
            vertex.adjacent << @vertices[index - 1].data unless index == 0 || @vertices[index - 1].data[0] != vertex.data[0]
            vertex.adjacent << @vertices[index + 1].data unless !@vertices[index + 1] || @vertices[index + 1].data[1] == 0
            vertex.adjacent << @vertices[index + @value].data unless !@vertices[index + @value]
            vertex.adjacent << @vertices[index - @value].data unless !@vertices[index - @value] || vertex.data[0] == 0
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

    #find_path method now snakes its way around the board as intended
    #need to alter it so that it stops if the pointer is on the same row/col as the target
    #and moves further in the right direction

    def find_path(first, last)

        visited = []
        q = []
        q << first

        until visited.last == last
            visited << q.shift unless visited.include?(q.first)
            @list[visited.last].each do |adj|
                next if visited.include?(adj) || q.include?(adj)
                q << adj if q.empty? || @list[q.last].include?(adj)
            end
        end

        p visited

    end

end

test = Board.new(8)

test.find_path([0, 0], [7, 7])