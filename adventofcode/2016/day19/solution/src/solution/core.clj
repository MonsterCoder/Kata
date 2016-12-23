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
      (if (empty? )
        cc
        (recur (concat cc next) []))
      (let [[[p1 n1] [p2 n2] & rest] cc] 
        (recur rest (conj next [p1 (+ n1 n2)]))))))
    
(defn pick [lst]
  "pick the middle left"
  (let [p (int (Math/ceil (/ (count lst) 2)))]
    (let [[f s] (split-at p lst)]
      [(last f) (concat (drop-last f) s)]))  
)
(defn play2 [cc]
  "play the game in rule2"
  ;;(println cc)
  (if (= 1 (count cc))
    cc
    (let [[[p n] & rest] cc]
      (let [[[p2 n2] next] (pick rest)]
         (recur  (concat next [[p (+ n n2)]] ))))))
