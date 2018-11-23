;;;; package.lisp

(defpackage #:cl-turtles
  (:use #:cl #:vecto)
  (:export
   #:turtle
   #:forward
   #:back
   #:right
   #:left
   #:arc-r
   #:arc-l
   #:with-turtle
   #:x
   #:y
   #:moves
   #:angle
   #:info
   #:draw-turtle
   #:with-turtle
   #:it))

