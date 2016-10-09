defmodule Solution do
  @input "input.txt"

  def run do
    @input
    |> File.stream!
    |> Stream.map(&String.strip/1)
    |> Stream.map(&nice?/1)
    |> Enum.filter(&(&1))
    |> Enum.count
    |> IO.puts
  end
  
  def nice?(line), do: nice?(to_char_list(line), [ hasPair: false, hasRepeat: false])
  
  def nice?(_, [hasPair: true, hasRepeat: true]), do: true

  def nice?(chars, _) when length(chars) < 3, do: false

  def nice?([a, b, c], [hasPair: true, hasPepeat: _]) when a == c, do: true

  def nice?([a, b, c], _), do: false 
    
  def nice?([a, b, c | tails], [hasPair: p, hasRepeat: r]) do
     nice?([b, c |  tails], [hasPair: (p || hasPair?( [c | tails], [a, b])), hasRepeat: (r ||  (a == c))])
  end
  
  def hasPair?(list, [a,b]) when length(list) < 2, do: false
  def hasPair?([x, y | tails], [a,b]) when [a,b] ==[x, y], do: true

  def hasPair?([x, y | tails], [a, b]), do: hasPair?([y | tails], [a,b])
end
