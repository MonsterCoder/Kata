ExUnit.start()

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: [nice?: 1, hasPair?: 2]

  test "ab exists in xabce" do
    assert hasPair?('xabce', 'ab') == true
  end 
 
  test "ab does not exits in xacbce" do
    assert hasPair?('xacbce', 'ab') == false
  end

  test "qjhvhtzxzqqjkmpb is nice" do
    assert nice?("qjhvhtzxzqqjkmpb") == true
  end

  test "xxyxx is nice" do
    assert nice?("xxyxx") == true
  end

  test "uurcxstgmygtbstg is naughty" do
    assert nice?("uurcxstgmygtbstg") ==false
  end

  test "ieodomkazucvgmuy is naught" do
    assert nice?("ieodomkazucvgmuy") == false
  end
end
