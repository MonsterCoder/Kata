ExUnit.start()

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: ['set': 2, 'rect': 2,'parse': 2]  
  test "1" do
    g = [ [0,0,0], [0,0,0]]
    a = set({0,1}, g)
    assert Enum.at(a,0) == [0,1,0]

  end

  test "rect 3 * 2" do
    g = [ [0,0,0,0],
      [0,0,0,0],
      [0,0,0,0],
      [0,0,0,0]]

    a = rect("3x2", g)
    assert a == [
      [1,1,1,0],
      [1,1,1,0],
      [0,0,0,0],
      [0,0,0,0]
    ]
  end

  test "rotate row y=0 by 4" do
    g = [
      [1,0,1,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,0,0,0,0,0,0]
    ]
   a = "rotate row y=0 by 4"
   |> String.split
   |> parse(g)
   assert a == [
     [0,0,0,0,1,0,1],
     [0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0],
     [0,0,0,0,0,0,0]
   ]
  end
  
  test "rotate column x=1 by 1" do
    g = [
      [0,0,0,0,0,0,0],
      [0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0],
      [0,1,0,0,0,0,0],
      [0,1,0,0,0,0,0],
      [0,1,0,0,0,0,0]
    ]
   a = "rotate column x=1 by 1"
   |> String.split
   |> parse(g)
   assert a == [
     [0,1,0,0,0,0,0],
     [0,0,0,0,0,0,0],
     [0,1,0,0,0,0,0],
     [0,0,0,0,0,0,0],
     [0,1,0,0,0,0,0],
     [0,1,0,0,0,0,0]
   ]
  end
  
end
