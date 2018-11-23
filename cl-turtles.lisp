;;;; cl-turtles.lisp

(in-package #:cl-turtles)

(defun dcos (ang)
  (cos (/ (* ang pi) 180)))

(defun dsin (ang)
  (sin (/ (* ang pi) 180)))

(defclass turtle ()
  ((curx :accessor x
         :initform 0)
   (cury :accessor y
         :initform 0)
   (angle :accessor angle
          :initform 90)
   (moves :accessor moves
          :initform nil)))

(defmethod move ((tl turtle) len)
  (let ((newx (+ (x tl)
                 (* len
                    (dcos (angle tl)))))
        (newy (+ (y tl)
                 (* len
                    (dsin (angle tl))))))
    
    (setf (moves tl) (cons (list (x tl)
                                 (y tl)
                                 newx
                                 newy) (moves tl)))
    (setf (x tl) newx)
    (setf (y tl) newy)))

(defmethod turn ((tl turtle) ang)
  (setf (angle tl) (+ ang (angle tl))))

(defmethod forward ((tl turtle) len)
  (move tl len))

(defmethod back ((tl turtle) len)
  (move tl (- len)))

(defmethod right ((tl turtle) ang)
  (turn tl (- ang)))

(defmethod left ((tl turtle) ang)
  (turn tl ang))

(defmethod info ((tl turtle))
  (list (x tl)
        (y tl)
        (angle tl)
        (moves tl)))

(defmethod arc-r ((tl turtle) ang)
  (dotimes (i ang)
    (forward tl 1)
    (right tl 1)))

(defmethod arc-l ((tl turtle) ang)
  (dotimes (i ang)
    (forward tl 1)
    (left tl 1)))

(defmethod draw-turtle ((tl turtle) &key (width 400) (height 400) (file "image.png"))
  (with-canvas (:width width :height height)
    (translate (/ width 2) (/ height 2))
    (with-graphics-state
      (move-to 0 0)
      (dolist (m (reverse (moves tl)))
        (line-to (third m) (fourth m)))
      (stroke))
    (save-png file)))

(defmacro with-turtle ((&key (file "./image.png")
                             (width 400)
                             (height 400))
                       &body body)
  `(let ((it (make-instance 'turtle)))
     (progn
       ,@body)
     (draw-turtle it :width ,width :height ,height :file ,file)))
