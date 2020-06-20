class Vertex

    attr_accessor :data, :adjacent

    def initialize(value)
        @data = value
        @adjacent = []
    end

end

class Board

    attr_accessor :list, :arr

    def initialize(value)

        @list = {}
        @arr = []

        0.upto(value - 1) { |num| @arr << Vertex.new(num) }

        @arr.each_with_index do |item, index|
            item.adjacent << @arr[index - 1] unless (index - 1) < 0
            item.adjacent << @arr[index + 1] unless !@arr[index + 1]
            @list[item.data] = item.adjacent
        end

    end

    def find(value)

        item = @arr[0]
        counter = 0
        
        until item.data == value
            item = @arr[counter]
            counter += 1
        end

        item

    end

    def depth_first(node = @list.values, visited = [])
        return if !node

        #my brain hurts
        #basically what I need to do is come up with a method that runs through the entire graph depth-first
        #right now the node is an array of arrays containing vertexes
        #I need to recurse through those values

    end

end

test = Board.new(10)

test.depth_first