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

        @list = {}
        @arr = []
        @vertices = []
        0.upto(value - 1) { |num| @arr << num }
        
        @arr.each do |row|
            @arr.each do |col|
                @vertices << Vertex.new([row, col])
            end
        end

        @vertices.each_with_index do |vertex, index|
            #adds the node's predecessor to its adjacency array, if it exists
            vertex.adjacent << @vertices[index - 1].data unless index == 0
            #adds the node's successor to its adjacency array, if it exists
            vertex.adjacent << @vertices[index + 1].data unless !@vertices[index + 1]
            #adds the node 'underneath' the current node to its adjacency array, if it exists
            vertex.adjacent << @vertices[index + value].data unless !@vertices[index + value]
            @list[vertex.data] = vertex.adjacent
        end

        #need to refactor the find function so that it navigates the adjacency list
        #rather than the array of vertexes

        def find(value)

            pointer = @vertices[0]
            counter = 0

            until pointer.data == value
                pointer = @vertices[counter]
                counter += 1
            end

            pointer.data

        end

    end

    #I need to refactor this function to work with my new and improved adjacency list structure

    # def breadth_first
    #     visited = []
    #     q = []
    #     q << find(0)
    #     p q[0].data
    #     until q.empty?
    #         visited << q.shift
    #         visited.last.adjacent.each do |item|
    #             q << item if !visited.include?(item)
    #             p item.data if !visited.include?(item)
    #         end
    #     end
    #     visited
    # end

end

test = Board.new(8)

p test.vertices