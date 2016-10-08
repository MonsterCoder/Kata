ExUnit.start

defmodule Solution_test do
  use ExUnit.Case, async: true
  import Solution, only: [eval: 1, from: 1]

  test "return final result" do
    assert eval([100]) == 100
  end

  test "eval [1,'',2] to 12" do
    assert eval([1,"",2]) ==12
  end

  test "eval [2,+,3,'',4] to 36" do
    assert eval([2,"+",3,"",4]) == 36
  end

  test "eval [2,+,3,'',4, -, 5] to 31" do
    assert eval([2,"+",3,"",4, "-", 5]) == 31
  end

  test "eval [2,+,3,'',4, -,5,'',6] to -20" do
    assert eval([2,"+",3,"",4,"-",5,"",6]) == -20
  end
  test "eavl [3,+, 4,'',5,-,6,'',7] to 15" do
    assert eval([3,"+",4,"",5,"-",6,"",7]) == -19
  end
  test ~s([1, "+", 2, "+", 3, "-", 4, "-", 5, "+", 6, "+", 7, "", 8, "+", 9]) do
    assert eval([1, "+", 2, "+", 3, "-", 4, "-", 5, "+", 6, "+", 7, "", 8, "+", 9]) == 90
  end 
  test "generate 9..9" do
    assert from(9) == [[9]]
  end
  
  test "generate 8..9" do
    assert from(8) == [[8,"+",9], [8,"-",9],[8,"",9]]
  end
  
  test "generate 7..9" do
    assert from(7) == [
     [7,"+",8,"+",9], 
     [7,"+",8,"-",9],
     [7,"+",8,"",9],
     [7, "-",8,"+",9], 
     [7,"-",8,"-",9],
     [7,"-",8,"",9],
     [7, "",8,"+",9], 
     [7,"",8,"-",9],
     [7,"",8,"",9],
   ]
  end
end
