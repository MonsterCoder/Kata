(ns clojure-solution.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))
(map inc [1 2 3])
(->> [1 2 3]
     (map str)
     reverse
     (mapv dec))
