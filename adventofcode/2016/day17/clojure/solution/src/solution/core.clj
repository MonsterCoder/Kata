 (ns solution.core
  (:import java.security.MessageDigest))
(declare step)
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

(defn shortest [[l p] [c pt passcode]]
  (if (> l (.length passcode))
    (let [[x y](step pt passcode [l p])] (if (> l x)  [x y]  [l p]))
    [l p]))

(defn longest [[l p] [c pt passcode]]
    (let [ [x y] (step2 pt passcode)] (if (>= x l)  [x y]  [l p])))

(defn step 
  ([pt passcode] (step pt passcode [99999999 passcode]))
  ([pt passcode best]
    ;;(let [[x y] pt] (println (str "*" x "-" y "*" best " * "  passcode)))
    (if (= pt [3 3])
      [(.length passcode) passcode]
      ( ->> (md5-hash passcode)
        (map-indexed #(mv %1 %2 pt passcode ))
        (filter valid?)
        (#(if (empty? %) [99999999 passcode] (reduce shortest best %)))
      ))))

(defn step2 [pt passcode]
    ;;(let [[x y] pt] (println (str "*" x "-" y "*" best " * "  passcode)))
    (if (= pt [3 3])
      [(.length passcode) passcode]
      ( ->> (md5-hash passcode)
        (map-indexed #(mv %1 %2 pt passcode ))
        (filter valid?)
        (#(if (empty? %) [0 passcode] (reduce longest [0 ""] % )))
      )))
