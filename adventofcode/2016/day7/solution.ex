defmodule Solution do
    @input "input2.txt"
    def run do
      @input
      |> File.read!
      |> String.strip
      |> String.split("\n")
      |> Enum.map(&tls?/1)
      |> Enum.sum
      |> IO.puts
    end
    def debug(line) do
      IO.puts line
      line
    end

    def debug2(lst) do
      lst
      |> Enum.map(&IO.puts/1)
      
      lst
    end

    def tls?(str) do
       str
      |> String.replace("[", "|")
      |> String.replace("]", "|")
      |> String.split("|")
      |> Enum.map(&abba?/1)
      |> Stream.with_index
      |> Enum.reduce([0,0],&check/2)
      |> judge
    end
    defp check({x,idx}, [_,1]) do
      [0,1]
    end

    defp check({x,idx}, [a,0]) do
      i = rem(idx, 2)
      if i == 0 do
       [rem(a+x,2), 0] 
      else
        [a, x]
      end
    end
    defp judge([_,1]) do
      0
    end

    defp judge([0,_]) do
      0
    end

    defp judge([_, 0]) do
      1
    end
    
    def abba?(<<a,b,b,a>>) when a != b do
      1
    end

    def abba?(str) do
      if  String.length(str) > 4 do
        r = str
        |> String.slice(0..3)
        |> abba?
         
        if r == 0 do
          str
          |> String.slice(1..-1)
          |> abba?
        else
          1
        end
      else
      0
      end

    end

    
                                          
end
