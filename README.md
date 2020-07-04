# Knights-Travails

This is my solution to the Knights Travails assignment from The Odin Project.

The goal was to create an 8 x 8 chess board and then use an algorithm to calculate the shortest path between two vertices. Learn more about the assignment:

https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms

This was definitely my most challenging assignment yet. I spent some time figuring out how to create a two-dimensional graph. The solution seems laughably simple now; just give each edge an [x, y] value!

I also struggled for a bit with tracing the path. I knew how breadth-first search worked from the previous binary search tree project but it took a while to apply that knowledge to finding the shortest path in this data structure.

A third challenge was filling the adjacency list with only legal moves based on the knight's L-shaped path. I eventually figured this out and it was perhaps the most satisfying achievement of this project since everything came together pretty quickly after that. I just evaluated to see if a node was a certain number (three) squares away and whether one 'side' of that move was longer than the other. That will always give you the right match for the adjacency list. 

What I also like about this solution is that it allows you to go into the @legal_move hash and alter the move's parameters. Set all values to one, for example, and find_path will move in single squares and give you the correct answer (specifically, [0, 0] -> [1, 0] will make the appropriate jump down rather than trying to snake through the entire first row and back down the next one).

All in all, a very fulfilling project.
