#|(progn
  (ql:quickload :cl-who)
  (use-package :cl-who)
  (ql:quickload :cl-css)
  (use-package :cl-css)
  (ql:quickload :parenscript)
  (use-package :parenscript)
  (setf (readtable-case *readtable*) :invert))
(load "/media/an/M11/git/anhongz.github.io/az.lisp")
|# 

(defun export2file (cl &key (file "/tmp/tmp.html"))
  (with-open-file (stream file :direction :output :if-exists :supersede)
    (format stream cl)))

(defun az ()
  (with-html-output (*standard-output* nil :prologue t :indent t)
    (:html 
      (:head
        (:script :src "three.min.js")
        (:script :src "p5.js")
        (:link :rel "stylesheet" :type "text/css" :href "ball.css")
        )
      (:body
        ;;(:div :id "WebGL-output")
        ;;(:div :id "Stats-output")
	(:script :src "ball.js")
	(:div :id "sidebar"
	  (:p "hello: " (:label :id "lb_count" "hello")))
        ))))

(progn
  (export2file (az) :file "/media/an/M11/git/anhongz.github.io/az.html")
  
  )

