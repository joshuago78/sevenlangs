(ns day2.core)


;; Assignment 1: create an unless macro with an else clause

(defmacro unless [test body else]
	(list 'if (list 'not test) body else)
)


;; Assignment 2: implement a class with defprotocol and defrecord

;; I created a very simple Lamp switch class

(def switchstates [:off :on])

(defn flipswitch [currentstate]
	(if (= currentstate 0) 1 0)
)

(defprotocol Switch
	(power [c])
	(flip [c])
)

(defrecord Lamp [state]
	Switch
		(power [_] (switchstates state))
		(flip [_] (Lamp. (flipswitch state)))
	Object
		(toString [this] (str "[" (switchstates (state this)) "]"))
)

;; To use in lein
;; (require '[day2.core :as day2])
;; (import '(day2.core Lamp))
;; (def x (Lamp. 0))
;; x
;; (day2/power x)
;; (def y (day2/flip x))
;; y