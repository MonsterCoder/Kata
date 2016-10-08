defmodule Solution do
  @input "input.txt"

  def run do
    File.stream!(@input,[], :line) 
    |> Enum.map(&String.rstrip/1) #remove trailing \n
    |> Enum.map(&String.split/1) #split string to numbers
    |> Enum.reduce(:ok, &parse/2)
  end

  ## start set
  def parse([n, x1,y1,x2,y2], :ok) do
    {false, [ gopher: {x1, y1}, dog: {x2, y2}] }
  end

  ##already found escape, pass through
  def parse([x,y], {true, hole}) do
    {true, hole }
  end

  ##has not found escape yet
  def parse([x,y], {false, [gopher: {x1, y1}, dog: {x2, y2}]} )  do
    case dist([x1, y1], [x,y]) *2 <= dist([x2, y2], [x, y]) do
      true -> {true, [x, y]}
      _ -> {false, [gopher: {x1, y1}, dog: {x2, y2}]}
    end
  end

  ##end of a set when hit  empty line
  def parse([], {true,[x, y]}) do
    IO.puts "The gopher can escape from hole #{x} #{y}" 
    :null
  end

  def parse([], {false, _}) do
    IO.puts "The gopher can not escape"
  end

  ##end of input file
  def parse([], :null) do
    IO.puts "The End"
  end 

  defp dist([x1, y1], [x2, y2]) do
    {a1, _} = Float.parse x1
    {b1, _} = Float.parse y1
    {a2, _} = Float.parse x2
    {b2, _} = Float.parse y2

    :math.pow((a1-a2), 2) + :math.pow((b1-b2), 2)
    |> abs
    |> :math.sqrt
  end
end
