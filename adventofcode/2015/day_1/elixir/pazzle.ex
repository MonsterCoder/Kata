defmodule Pazzle do
  @input 'input.txt'

  def run() do 
    floor(File.stream!(@input,[],1));
  end

  def run(target_floor) do
    floor( File.stream!(@input,[],1), target_floor)
  end

  #part 2
  def floor(input, target_floor) do
    idx =input
    |> Stream.scan(0, &(&2 + parse(&1)))
    |> Enum.find_index &(&1==target_floor)  
    idx + 1
  end

  #part 1
  def floor(input) do
    input
    |> Enum.reduce(0, &(&2 + parse(&1)))
  end


  defp parse("("), do: 1
  defp parse(")"), do: -1
  defp parse(_), do: 0
end

