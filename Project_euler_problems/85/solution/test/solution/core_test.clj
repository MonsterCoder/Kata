(ns solution.core-test
  (:require [clojure.test :refer :all]
            [solution.core :refer :all]))

(deftest oneDim
  (testing "1 x 1"
    (is (= 1 (rectCount 1 1)))))

(deftest twoOneDim
  (testing "2 x 1"
    (is (= 3 (rectCount 2 1)))))
(deftest threeTwoDim
  (testing "3 x 2"
    (is (= 18 (rectCount 3 2)))))
