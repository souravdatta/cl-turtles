;;;; cl-turtles.asd

(asdf:defsystem #:cl-turtles
  :description "Describe cl-turtles here"
  :author "Sourav Datta (soura.jagat@gmail.com)"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:vecto)
  :components ((:file "package")
               (:file "cl-turtles")))
