(ns day1)


(defn big
	[st n]
	(> (count st) n))


(defn collection-type [col]
	(let [Type (str (type col))]
		(if (= Type "class clojure.lang.PersistentVector")
			:vector
			(if (= Type "class clojure.lang.PersistentList")
				:list
				(if (= Type "class clojure.lang.PersistentHashMap")
					:map
					(if (= Type "class clojure.lang.PersistentHashSet")
						:set
					)
				)
			)
		)
	)
)


(def l '(1 2 3))
(def v [1 2 3])
(def m {:a 1 :b 2 :c 3})
(def s #{:a :b :c})