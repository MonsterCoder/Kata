defmodule Solution do
  @input "input.txt"
  @vowels 'aeiou'

  def run do
    @input
    |>File.stream!
    |> Stream.map(&String.strip/1)
    |> Enum.map(&nice?/1)
    |> Enum.filter(&(&1))
    |> Enum.count()
    |> IO.puts
  end
  
  def nice?(line), do: nice?(to_char_list(line),  [legal: true, vowels: 0, twice: 0])

  def nice?(_, [legal: false, vowels: _, twice: _]), do: false 

  def nice?([], [legal: true, vowels: v, twice: t]), do:  v > 2 && t > 0

  def nice?([a], [legal: true, vowels: v, twice: t]),do: nice?([], [legal: true, vowels: v+count_vowel(a), twice: t])

  def nice?([a |tails], [legal: true, vowels: v, twice: t]) do
    [b | _] = tails
    nice?(tails, [legal: legal_word(a,b), vowels: v+count_vowel(a), twice: t + count_chars_same(a,b)]) 
  end

  defp count_chars_same(a, b) when a == b, do: 1
  defp count_chars_same(a, b), do: 0
  
  defp count_vowel(a) when a in @vowels, do: 1
  defp count_vowel(a), do: 0
  
  defp legal_word(a,b) do
    case [a , b] do
      'ab' -> false
      'cd' -> false
      'pq' -> false
      'xy' -> false
      _ -> true
    end
  end

end
