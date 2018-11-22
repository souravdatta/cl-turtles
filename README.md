# cl-turtles
#### _Sourav Datta (soura.jagat@gmail.com)_

This is a project to implement Logo style turtle geometry in Common Lisp.
Here we deviate from the interactive nature of Logo and draw more in the form of writing a program and then
generating a PNG file with the drawing as the output of that program. 

To install it, run this:

    $ cd ~/quicklisp/local-projects/
    $ git clone git://github.com/souravdatta/cl-turtles.git

(Note: the local-projects directory may be different in your system, specially if you are using an IDE like Portacle. In which case you'd need to find where it is located.) 

A simple example is as below:

    (ql:quickload :cl-turtles)
    (in-package :cl-turtles)
    
    (with-turtle (:file "~/Pictures/hello.png")
      (labels ((octagon (tl)
                 (dotimes (i 8)
                   (forward tl 40)
                   (right tl 45))))
         (dotimes (i 48)
           (octagon it)
           (right it 10))))

![](https://github.com/souravdatta/cl-turtles/blob/master/hello.png)

### License

MIT

