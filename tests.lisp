(ql:quickload :braid-drakma)
(ql:quickload :braid)

(defun test1 ()
	"Tests a web request to the Google search engine."
	(let ((response
	       (braid-drakma:http-request
		(braid:make-http-request :uri "http://www.google.co.uk"))))
	  (eq (braid:http-response-status response) 200)))

(defun test2 ()
	"Tests a web request to the Google search engine."
	(let ((response
	       (braid-drakma:http-request
		(braid:make-http-request :uri "https://www.google.co.uk"))))
	  (eq (braid:http-response-status response) 200)))

;; (test1)

