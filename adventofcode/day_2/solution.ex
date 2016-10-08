defmodule NoMath do
 @input "input.txt"

  def part1() do
    load
    |> Stream.map(&cal/1)
    |> Enum.sum
  end 

  def part2() do
    load
    |> Stream.map(&cal_ribbon/1)
    |> Enum.sum
  end

  def load() do
    File.stream!(@input, [], :line)
        |> Stream.map(&String.rstrip/1)
        |> Stream.map(&(String.split(&1,"x")))
        |> Stream.map(fn (str) ->
              str 
              |> Enum.map(&Integer.parse/1) 
              |> Enum.map( fn{n,_} ->n end)
          end)

  end

  def cal([l, h, w]) do
    area = [l *h , l * w , h * w] 
    wrap =Min.of area
    Enum.sum(area)*2+wrap
  end

  def cal_ribbon([l, h, w]) do
    perimeter = Min.of [ 2 * (l+h) ,2 * ( h+w) , 2*(l+ w)]
    bowe = l * h * w

    perimeter + bowe
  end

end

## my own implementation of Enum.min,
defmodule Min do
  def of([], acc), do: acc
  def of([head | tail]), do: of(tail, head)
  def of([head | tail], acc) when head > acc  do
    of(tail, acc)
  end
  def of([head | tail], acc) do
    of(tail, head)
  end
end
