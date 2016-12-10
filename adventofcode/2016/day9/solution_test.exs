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
  test "A(2x2)BCD(2x2)EFG" do
    assert decomp("A(2x2)BCD(2x2)EFG") =="ABCBCDEFEFG"
  end
  test "(6x1)(1x3)A" do
    assert decomp("(6x1)(1x3)A") =="(1x3)A"
  end
  test "X(8x2)(3x3)ABCY" do
    assert decomp("X(8x2)(3x3)ABCY") =="X(3x3)ABC(3x3)ABCY"
  end
end
