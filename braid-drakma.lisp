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

(defmethod drakma-force-binary ((request cons))
  (getf request :drakma-force-binary))

;; TODO: Consider supporting wider drakma options such as proxy etc.

;;;

(defun web-request (request &key (force-binary nil))
  "Uses Drakma to make the specified http request."
  (multiple-value-bind  (body status headers)
      (drakma:http-request (uri request) 
			   :method (request-method request) 
			   :content-type nil
			   :additional-headers (plist-alist (headers request))
			   :content (body request)
			   :certificate (drakma-certificate request)
			   :key (drakma-key request)
			   :certificate-password (drakma-certificate-password request)
				 :force-binary (drakma-force-binary request))
    (braid:make-response :status status :headers headers :body body)))




