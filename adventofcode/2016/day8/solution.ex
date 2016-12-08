
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
        rect(op, g)
      end

      def parse(["rotate", "row", y, "by", count], g) do
        yn= String.split(y,"=")
        rotateRow(yn, count, g)
      end
      def parse(["rotate", "column", x, "by", count], g) do
        xn= String.split(x,"=")
        rotateColumn(xn, count, g)
      end

      def rotateRow([_,x], count,g) do
        r = String.to_integer(x)
        cnt = String.to_integer(count)
        row = Enum.at(g, r)
        shifted = 1..cnt
        |> Enum.reduce(row, &shiftR/2)
        
        List.replace_at(g,r, shifted)
      end

      def rotateColumn([_,y], count,g) do
        c = String.to_integer(y)
        cnt = String.to_integer(count)
        col = (for r <- 0..5, do: get({r, c}, g))

        shifted = 1..cnt
        |> Enum.reduce(col, &shiftR/2)

        0..5
       |> Enum.reduce(g, &(set({&1,c}, Enum.at(shifted, &1), &2) ))
      end


      def shiftR(n, list)  do
        [h |tail] = Enum.reverse(list)
        tail++ [h]
        |> Enum.reverse
      end

      def rect(op,g) do
        [x,y] = op |> String.split("x")
        cols =String.to_integer(x)
        rows = String.to_integer(y)

        (for r <- 0..rows-1, c <- 0..cols-1, do: {r,c})
        |> Enum.reduce(g, &set/2) 
        
      end

      def set({r,c}, g) do
       set({r,c},1,g)
      end 

      def set({r,c},v, g) do
       u = g
       |> Enum.at(r)
       |> List.replace_at(c,v)

       g
       |> List.replace_at(r,u)
      end     

      def get({r,c}, g) do
        g
        |> Enum.at(r)
        |> Enum.at(c)
      end
end
