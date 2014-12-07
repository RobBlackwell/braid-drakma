;;;; braid-drakma.lisp

(in-package #:braid-drakma)

(defun web-request (http-request &key (drakma-key nil) (drakma-certificate nil) (drakma-certificate-password nil)(drakma-force-binary nil))
  "Uses Drakma to make the specified http request."
  (multiple-value-bind  (body status headers)
      (drakma:http-request (braid:http-request-uri http-request) 
			   :method (braid:http-request-method http-request) 
			   :content-type nil
			   :additional-headers (plist-alist (braid:http-message-headers http-request))
			   :content (braid:http-message-body http-request)
			   :certificate drakma-certificate
			   :key drakma-key
			   :certificate-password drakma-certificate-password
			   :force-binary drakma-force-binary)
    (braid:make-http-response :status status :headers (alexandria:alist-plist headers) :body body)))

;;; End

