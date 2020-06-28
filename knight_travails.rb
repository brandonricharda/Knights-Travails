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

    #find_path method now finds the shortest path, moving in single unit increments
    #first it moves horizontally until finding the right column
    #then it moves vertically until landing at the target node
    #this was a good exercise but I need to refactor so that it follows the knight's move limitations

    def find_path(first, last)

        visited = []
        q = []
        q << first

        until visited.last && visited.last[1] == last[1]
            visited << q.shift unless visited.include?(q.first)
            @list[visited.last].each do |adj|
                next if visited.include?(adj) || q.include?(adj)
                q << adj if q.empty? || @list[q.last].include?(adj)
            end
        end

        q.clear

        q << @list[visited.last].select { |vertex| (vertex[0] - last[0]).abs < (visited.last[0] - last[0]).abs }.first

        until visited.last == last
            visited << q.shift unless visited.include?(q.first)
            return visited if visited.last == last
            @list[visited.last].each do |adj|
                next if visited.include?(adj) || q.include?(adj)
                q << adj if (adj[0] - last[0]).abs < (visited.last[0] - last[0]).abs
            end
        end

        visited

    end

end

test = Board.new(8)

p test.find_path([2, 7], [0, 0])

p test.find_path([0, 0], [2, 7])