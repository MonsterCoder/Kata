 solution.core
  (:import java.security.MessageDigest))
(def moves {0 [0 -1] 1 [0 1] 2 [-1 0] 3 [1 0]}) 
(defn md5 [s]
    (->> (-> (MessageDigest/getInstance "md5")
                        (.digest (.getBytes s "UTF-8")))
                (map #(format "%02x" %))
                       (apply str)))
(defn md5-hash [s]
  (subs (md5 s) 0 4))

(defn mv [pos c pt pc]
  [c (into [] (map + (get  moves pos) pt))  (str pc (get ["U" "D" "L" "R"] pos)) ])

(defn valid? [[c [x y] path]]
  (and (>= x 0) (>= y 0) (< x 4) (< y 4) (.contains (seq "bcdef") c)))
(defn debug [x]
  (println "---"  x)
  ;;(->> (map-indexed #(println (str %1 " " %2 " " pt  " " passcode)) passcode)
  (identity x))

(defn step 
  ([pt passcode]
    (let [[x y] pt] (println (str "*" x "-" y "*" passcode)))
    (if (= pt [3 3])
      (.length passcode)
      ( ->> (md5-hash passcode)
        (map-indexed #(mv %1 %2 pt passcode ))
        (filter valid?)
        (#(if (empty? %) 99999999 (apply min (map step %))))
      )))
  ([[c pt passcode]] (step pt passcode)))


(defn tt [x]
  (let [[c pt pc] x] (step pt pc)))

(defn run [pt passcode]
  (->> (step pt passcode)
       (first)
       (step)
       (first)
       (step)
       (first)
       (#(if (nil? %) 99999 (step %)))))
