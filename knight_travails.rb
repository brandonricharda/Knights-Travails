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

    #after some research and experimentation, I realized BFS is the way to do this, rather than DFS
    #next step is to use this BFS method to calculate the fastest path

    def breadth_first
        visited = []
        q = []
        q << find(0)
        until q.empty?
            visited << q.shift
            visited.last.adjacent.each do |item|
                q << item if !visited.include?(item)
            end
        end
    end

end

test = Board.new(10)

test.breadth_first