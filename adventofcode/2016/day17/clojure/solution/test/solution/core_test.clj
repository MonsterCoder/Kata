(ns solution.core-test
  (:require [clojure.test :refer :all]
            [solution.core :refer :all]))

(deftest hash-test
  (testing "hijkl"
    (is (= (md5-hash "hijkl") "ced9"))))

(deftest path-test
  (testing "ihgpwlah"
    (is (= (second (step [0 0]  "ihgpwlah")) "ihgpwlahDDRRRD")))
  (testing "kglvqrro"
    (is (= (second (step [0 0]  "kglvqrro")) "kglvqrroDDUDRLRRUDRD")))
  (testing "ulqzkmiv"
    (is (= (second (step [0 0]  "ulqzkmiv")) "ulqzkmivDRURDRUDDLLDLUURRDULRLDUUDDDRR"))))
