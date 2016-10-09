ExUnit.start()

defmodule Pazzle_test do
  use ExUnit.Case, async: true
  import Pazzle, only: [floor: 1, floor: 2]

  test "return 1 for (" do
    assert floor(["("]) == 1
  end

  test "return -1 for )" do
    assert floor([")"]) == -1
  end

  test "return 0 for else" do
    assert floor([" "])== 0
  end
    
  test "return 0 for ()" do
    assert floor(["(",")"]) == 0
  end

  test "retrun 1 for ()(" do
    assert floor(["(",")","("]) == 1
  end

  test "retrun 0 for ((()))())" do
    assert floor(["(","(","(",")",")",")","(",")",")"]) == -1
  end

  test "return 3 for ()) to enter basement" do
    assert floor(["(",")",")"],-1) ==3
  end
end
