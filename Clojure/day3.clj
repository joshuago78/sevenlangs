(ns day3.core)

;; Assignment: create a vector of accounts that can be altered using refs


(def accounts (ref [0 10 100 1000 10000]))


(defn debitacct [acctnum amount]
	(- (accounts acctnum) amount)
)

(defn creditacct [acctnum amount]
	(+ (accounts acctnum) amount)
)


(defn debit [acctnum amount]
	(dosync
		(alter accounts assoc acctnum (debitacct acctnum amount)
		)
	)
)

(defn credit [acctnum amount]
	(dosync
		(alter accounts assoc acctnum (creditacct acctnum amount)
		)
	)
)

(defn addacct [amount]
	(dosync 
		(alter accounts merge amount)
	)
)