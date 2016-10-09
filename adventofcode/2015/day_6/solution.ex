defmodule Solution do
  def parse_instruction(["turn","on",from,"through", to], lights_on)  do
    grid(point(from), point(to)) ++ lights_on
  end

  def parse_instruction(["turn","off",from,"through",to], lights_on) do
    lights_on -- grid(point(from), point(to))
  end

  def grid([x,y], [k,v]) do
    for a <- x..k, b <- y..v, do: {a, b} 
  end

  def point(str) do
    str
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
  
end
