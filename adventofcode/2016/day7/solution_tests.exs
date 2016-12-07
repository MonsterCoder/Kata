ExUnit.start()

defmodule Solution_test do
    use ExUnit.Case, async: true
    import Solution, only: ['abba?': 1, 'tls?': 1]  
    test "1" do
          assert abba?("abba") == 1
    end
    test "2" do
          assert abba?("aaaa") == 0
    end
    test "3 is nice" do
          assert abba?("abca") == 0
    end
    test "4444 nice" do
          assert abba?("abbay") == 1
    end
    test "5 nice" do
          assert abba?("xabbay") == 1
    end

    test "6 " do
      assert tls?("abba[mnop]qrst") ==1
    end
    test "7 " do
      assert tls?("abcd[bddb]xyyx") ==0
    end
    test "8 " do
      assert tls?("aaaa[qwer]tyui") ==0
    end
    test "9 " do
      assert tls?("ioxxoj[asdfgh]zxcvbn") ==1
    end

    test "10 " do
      assert tls?("tivudfusgnewzshs[mausfjbgxmyibin]yponuityptavbhekrlg[qeyafuevtlqemtfa]owtdxadrwwbxbrkl[obfcyxbifipwhduubu]mjocivgvrcbrllso") ==0
    end
    test "11" do
      assert tls?("ioxxoj[asdfgh]zxcvbn[xbddbyz]abcd") ==0
    end  
    test "12" do
      assert tls?("ioyxoj[asdfgh]xabbay[xbdybyz]abcd") ==1
    end  
end
