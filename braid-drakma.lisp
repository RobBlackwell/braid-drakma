;;;; braid-drakma.lisp

(in-package #:braid-drakma)

;;; Extend the braid interface with Drakma specific options

;; (defgeneric drakma-certificate (request))
;; (defgeneric drakma-key (request))
;; (defgeneric drakma-certificate-password (request))

;; (defmethod drakma-certificate ((request cons))
;;   (getf request :drakma-certificate))

;; (defmethod drakma-key ((request cons))
;;   (getf request :drakma-key))

;; (defmethod drakma-certificate-password ((request cons))
;;   (getf request :drakma-certificate-password))

;; (defmethod drakma-force-binary ((request cons))
;;   (getf request :drakma-force-binary))

;; TODO: Consider supporting wider drakma options such as proxy etc.

;;;

(defun web-request (http-request &key (drakma-key nil) (drakma-certificate nil) (drakma-certificate-password nil)(drakma-force-binary nil))
  "Uses Drakma to make the specified http request."
  (multiple-value-bind  (body status headers)
      (drakma:http-request (http-request-uri http-request) 
						   :method (http-request-method http-request) 
						   :content-type nil
						   :additional-headers (plist-alist (http-request-headers http-request))
						   :content (http-request-body http-request)
						   :certificate drakma-certificate
						   :key drakma-key
						   :certificate-password drakma-certificate-password
						   :force-binary drakma-force-binary)
    (braid:make-http-response :status status :headers (alexandria:alist-plist headers) :body body)))

;;; End

