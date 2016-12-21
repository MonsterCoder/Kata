(ns solution.core)
(def traps ["^^.", ".^^", "^..", "..^"])

(defn calc [x y z] 
  ;;(println x y z (contains? traps(str x y z)))
  (if (.contains traps (str x  y z))
    \^
    \.))

(defn parse [steps]
    (loop [left \.
           next-line []
           steps steps ]

      (let [center (first steps)
            right (second steps)]
        (if right
         (recur center
          (conj next-line (calc left center right))
          (drop 1 steps))
          (conj next-line  (calc left center \.))
         ))))      

(defn count-save [line]
  (reduce #( if (= \. %2) (inc %1) %1) 0 line))
(defn run [n line result cnt]
  (if (= n 0)
     cnt
    (let [next-line (parse line) next-result(conj result line) ]
    (recur (dec n) next-line next-result (+ cnt (count-save line))))))
           

