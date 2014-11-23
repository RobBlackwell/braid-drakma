braid-drakma
============

An adapter that allows Common Lisp Braid middleware to be used with
the Drakma HTTP client.

See [braid](https://github.com/RobBlackwell/braid).


	> (ql:quickload :braid-drakma) 
	...
	> (braid-drakma:web-request (braid:make-request :uri "http://www.google.co.uk"))
	...

THIS IS EXPERIMENTAL CODE THAT IS SUBJECT TO CHANGE. I welcome
feedback, but it's probably too early to consider including in
Quicklisp yet. That doesnt stop you trying it with quicklisp by using
[local-projects](http://www.quicklisp.org/beta/faq.html).

Rob Blackwell   
November 2014
