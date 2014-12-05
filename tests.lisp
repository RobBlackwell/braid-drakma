(ql:quickload :braid-drakma) 

(defun test1 ()
	"Tests a web request to the Google search engine."
	(let ((response
				 (braid-drakma:web-request
					(braid:make-request :uri "http://www.google.co.uk"))))
		(eq (braid:status response) 200)))

;; (test1)

