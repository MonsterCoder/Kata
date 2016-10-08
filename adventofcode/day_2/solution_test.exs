ExUnit.start()

defmodule NoMath_test do
  use ExUnit.Case, async: true

  import NoMath, only: [cal: 1]

  test "2x2x4 returns 58" do
   assert cal([2,3,4]) == 58
  end 
end
