defmodule Solution do
  def run() do
    "input.txt"
    |> File.stream!
    |> Stream.map(&String.strip/1)
    |> Stream.map(&(String.split(&1," ")))
    |> Enum.reduce(MapSet.new, &parse_instruction/2)
    |> Enum.count
    |> inspect
    |> IO.puts
  end

  def parse_instruction(["turn","on",from,"through", to], lights_on)  do
    grid(point(from), point(to))
    |> MapSet.union(lights_on)
  end

  def parse_instruction(["turn","off",from,"through",to], lights_on) do
     grid(point(from), point(to))
     |> Enum.reduce(lights_on, &(MapSet.delete(&2, &1)))
  end

  def parse_instruction(["toggle", from, "through", to], lights_on) do
    to_toggles =grid(point(from), point(to))
    to_turn_off = MapSet.intersection(lights_on, to_toggles)
    to_turn_on =  MapSet.difference(to_toggles, lights_on)

    to_turn_off
    |> Enum.reduce(lights_on, &(MapSet.delete(&2, &1)))
    |> MapSet.union(to_turn_on)  
  end

  
  def grid([x,y], [k,v]) do
    (for a <- x..k, b <- y..v, do: {a, b})
    |> MapSet.new
  end

  def point(str) do
    str
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
  
end
