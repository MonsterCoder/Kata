(ns solution.core)

(defn circle [n]
  "initial circle"
  (reduce #(conj %1 [%2 1]) [] (range 1 (+ n 1))))

(defn play [cc next]
  "play the game"
  ;;(println cc next)
  (if (nil? cc)
    (recur next [])
    (if (= 1 (count cc))
      (if (empty? next)
        cc
        (recur (concat cc next) []))
      (let [[[p1 n1] [p2 n2] & rest] cc] 
        (recur rest (conj next [p1 (+ n1 n2)]))))))
    
    
