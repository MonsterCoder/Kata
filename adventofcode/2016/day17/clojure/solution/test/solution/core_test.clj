(ns solution.core-test
  (:require [clojure.test :refer :all]
            [solution.core :refer :all]))

(deftest hash-test
  (testing "hijkl"
    (is (= (md5-hash "hijkl") "ced9"))))
