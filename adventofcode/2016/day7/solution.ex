defmodule Solution do
    @input "input.txt"
    def run do
      @input
      |> File.read!
      |> String.strip
      |> String.split("\n")
      |> Enum.map(&tls?/1)
      |> Enum.sum
      |> IO.puts
    end

    def tls?(str) do
       str
      |> String.replace("[", "|")
      |> String.replace("]", "|")
      |> String.split("|")
      |> Enum.map(&abba?/1)
      |> parse
    end

    def parse([]) do
      0
    end

    def parse([a]) do
      a
    end
    def parse([1,0 | _]) do
       1
    end
    
    def parse ([_,_ |tail]) do
      parse(tail)
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
