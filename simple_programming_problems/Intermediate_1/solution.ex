defmodule Solution do
  @op ["+","-",""]

  def from(9), do: [[9]] 

  def from(i) do
    for op <- @op, next <- from(i+1), do: [i, op] ++ next
  end

  def eval([x]), do: x
  def eval([x, "", y | tail]), do: eval([x*10+y | tail])
  def eval([x, "+", y | tail]), do: x + eval([y | tail])
  def eval([x, "-", y | tail]), do: x -  eval([y | inverse_sign(tail)])

  def inverse_sign([]), do: []  
  def inverse_sign(["" | tail]), do: ["" | inverse_sign(tail)]
  def inverse_sign(["+"| tail]), do: ["-" | inverse_sign(tail)]
  def inverse_sign(["-"| tail]), do: ["+" | inverse_sign(tail)]
  def inverse_sign([x | tail]), do: [x | inverse_sign(tail)]

  def run() do
    from(1)
    |> Enum.filter(&(eval(&1)==100))
    |> Enum.map(&inspect/1)
    |> Enum.map(&IO.puts/1)    
  end
end
