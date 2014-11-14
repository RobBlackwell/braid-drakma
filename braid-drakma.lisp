;;;; braid-drakma.lisp

(in-package #:braid-drakma)

;;; Extend the braid interface with Drakma specific options

(defgeneric drakma-certificate (request))
(defgeneric drakma-key (request))
(defgeneric drakma-certificate-password (request))

(defmethod drakma-certificate ((request cons))
  (getf request :drakma-certificate))

(defmethod drakma-key ((request cons))
  (getf request :drakma-key))

(defmethod drakma-certificate-password ((request cons))
  (getf request :drakma-certificate-password))

;;;

(defun web-request (request)
  "Uses Drakma to make the specificed http request."
  (multiple-value-bind  (body status-code headers)
      (drakma:http-request (request-uri request) 
			   :method (request-method request) 
			   :content-type nil
			   :additional-headers (message-headers request) 
			   :content (message-body request)
			   :certificate (drakma-certificate request)
			   :key (drakma-key request)
			   :certificate-password (drakma-certificate-password request))
    (braid:make-response :status-code status-code :headers headers :body body)))




