ExUnit.start()

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: [nice?: 1]  
  
  test "ugknbfddgicrmopn is nice" do
    assert nice?("ugknbfddgicrmopn") == true
  end
  
  test "aaa" do
    assert nice?("aaa") == true
  end
  test "jchzalrnumimnmhp" do
    assert nice?("jchzalrnumimnmhp") == false
  end

  test "haegwjzuvuyypxyu" do
    assert nice?("haegwjzuvuyypxyu")==false
  end

  test "dvszwmarrgswjxmb" do
    assert nice?("dvszwmarrgswjxmb") ==false
  end
end
