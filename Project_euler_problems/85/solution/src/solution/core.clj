(ns solution.core)

(defn comb [x]
(  loop [ n x, acc 0]
   ( if (= n 0)
      acc
      (recur  (dec n) (+ acc n)))))
(defn rectCount [x, y]
   (cond
     ( and (  = x 1 ) ( = y 1))   1
     (  = y 1 )    (comb x )
     (  = x 1 )    (comb y)
     :else (* ( comb x) ( comb y) )
  )
)

(defn -main []
  (println (rectCount 1999 1 )))
