defmodule Solution do
  def run() do
    "input.txt"
    |> File.stream!
    |> Stream.map(&String.strip/1)
    |> Stream.map(&(String.split(&1," ")))
    |> Enum.map(&debug/1)
    |> Enum.reduce([], &parse_instruction/2)
    |> Enum.count
    |> inspect
    |> IO.puts
  end

  def debug(x) do
    IO.puts x
    x
  end
  def parse_instruction(["turn","on",from,"through", to], lights_on)  do
    grid(point(from), point(to)) ++ lights_on
    |> Enum.uniq
  end

  def parse_instruction(["turn","off",from,"through",to], lights_on) do
    lights_on -- grid(point(from), point(to))
  end

  def parse_instruction(["toggle", from, "through", to], lights_on) do
    lights_on ++ grid(point(from), point(to))
    |> Enum.sort(fn ({x,y},{k,v}) -> (y - v) +(x-k) * 10000 <0 end )
    |> remove_double_element
  end

  def remove_double_element([]), do: []
  def remove_double_element([x]), do: [x]
  def remove_double_element([x,y|tail]) when x==y, do: remove_double_element(tail)
  def remove_double_element([x,y|tail]), do: [x|remove_double_element([y |tail])]
  
  def grid([x,y], [k,v]) do
    for a <- x..k, b <- y..v, do: {a, b} 
  end

  def point(str) do
    str
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
  
end
