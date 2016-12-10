ExUnit.start()

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: ['decomp': 1]

  test "ADVENT" do
    assert decomp("ADVENT") == "ADVENT"
  end

  test "A(1x5)BC" do
    assert decomp("A(1x5)BC" =="ABBBBBC"
  end
end
