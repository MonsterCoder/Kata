
defmodule Solution do
      @input "input.txt"
          def run do
            grid = 0..5
            |> Enum.into([], fn y->  0..49 |> Enum.map(&(&1*0) ) end)
            @input
              |> File.read!
              |> String.strip
              |> String.split("\n")
              |> Enum.map(&(&1 |> String.split))
              |> Enum.reduce(grid, &parse/2)
      end
      
      def parse(["rect", op], g) do
      end

      def rect(op,g) do
        [x,y] = op |> String.split("x")
        cols =String.to_integer(x)
        rows = String.to_integer(y)

        (for r <- 0..rows-1, c <- 0..cols-1, do: {r,c})
        |> Enum.reduce(g, &set/2) 
        
      end

      def set({r,c}, g) do
       u = g
       |> Enum.at(r)
       |> List.replace_at(c,1)

       g
       |> List.replace_at(r,u)
      end     
end
