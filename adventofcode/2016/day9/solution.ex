defmodule Solution do
  def run(fname \\ "input.txt") do
    fname
    |> File.read!
    |> String.strip
    |> decomp("")
    |> IO.puts
  end

  def decomp(str), do: decomp(str,"")
  def decomp("", acc), do: acc 
  def decomp(<<40, tail::binary>>, acc) do 
    decomp(tail,acc,[""])
  end


  def decomp(<<41 , tail::binary>>, acc, [marker]) do
   tail
   |> repeat(acc,marker)
  end 

  def decomp(<<c , tail::binary>>, acc, [marker]) do
    decomp(tail, acc, [marker <> <<c>>])
  end

  def decomp(<<c , tail::binary>>, acc) do

    decomp(tail, (acc <> <<c>>))
  end

  def repeat(tail, acc, marker) do
    [x,y]= String.split(marker,"x")
    IO.puts String.to_integer(x)
    {r, rest} =tail
    |> String.split_at(String.to_integer(x))
  

    rep = 0..String.to_integer(y)-1
    |> Enum.reduce("", fn (i, rr) -> r <> rr end)

    acc <> rep <> decomp(rest)
  end
end
