ExUnit.start()

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: [parse_instruction: 2]
  test "turn on 0,0 to 1,2" do
    assert parse_instruction(["turn","on","0,0","through","1,2"], [{4,4}]) == [{0,0}, {0,1}, {0,2}, {1,0}, {1,1},{1,2}, {4,4}]
  end
  
  test "turn off  0,0 to 1,2" do
    assert parse_instruction(["turn","off","0,0","through","1,2"], [{0,0},{0,2},{4,4}]) == [{4,4}]
  end
  

  
end
