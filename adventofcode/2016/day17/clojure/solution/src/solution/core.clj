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
  [c (map + (get  moves pos) pt)  (str pc c) ])

(defn valid? [[c [x y] path]]
  (and (>= x 0) (>= y 0) (.contains (seq "bcdef") c)))
  
(defn step [passcode pt]
 ( ->> (md5-hash passcode)
    (map-indexed #(mv %1 %2 pt passcode ))
    (filter valid?)))

