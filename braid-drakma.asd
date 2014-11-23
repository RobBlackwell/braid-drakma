;;;; braid-drakma.asd

(asdf:defsystem #:braid-drakma
  :version "0.0.1"
  :author "Rob Blackwell"
  :description "An adapter that allows Braid middleware to be used
with the Drakma HTTP client."
  :serial t
  :depends-on (#:alexandria 
	       #:drakma
	       #:braid)
  :components ((:file "package")
	       (:file "braid-drakma")))
