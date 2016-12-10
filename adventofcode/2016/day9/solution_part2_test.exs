ExUnit.start()

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: ['decomp': 1]

  test "ADVENT" do
    assert decomp("ADVENT") == "ADVENT"
  end

  test "A(1x5)BC" do
    assert decomp("A(1x5)BC") =="ABBBBBC"
  end

  test "(3x3)XYZ" do
    assert decomp("(3x3)XYZ") =="XYZXYZXYZ"
  end
  test "X(8x2)(3x3)ABCY" do
    assert decomp("X(8x2)(3x3)ABCY") =="XABCABCABCABCABCABCY"
  end
  test "(27x12)(20x12)(13x14)(7x10)(1x12)A" do
    assert String.length(decomp("(27x12)(20x12)(13x14)(7x10)(1x12)A")) == 241920
  end
  test "i(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN" do
    assert String.length(decomp("(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN")) == 445
  end
end
