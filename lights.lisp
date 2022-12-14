(in-package #:cl-game-models)

(defclass light ()
 ((num :accessor light-num :initform nil :initarg :num)
  (position :accessor light-position :initform nil :initarg :position)
  (ambient :accessor light-ambient :initform nil :initarg :ambient)
  (diffuse :accessor light-diffuse :initform nil :initarg :diffuse)
  (spot-intensity :accessor light-spot-intensity :initform nil :initarg :spot-intensity)
  (spot-direction :accessor light-spot-direction :initform nil :initarg :spot-direction)
  (specular :accessor light-specular :initform nil :initarg :specular)))

(defun make-light (num position ambient diffuse specular spot-direction spot-intensity)
  (make-instance 'light
	 :num (cond ((= num 0) opengl:*gl-light0*)
		    ((= num 1) opengl:*gl-light1*)
		    ((= num 2) opengl:*gl-light2*)
		    ((= num 3) opengl:*gl-light3*)
		    ((= num 4) opengl:*gl-light4*)
		    ((= num 5) opengl:*gl-light5*)
		    ((= num 6) opengl:*gl-light6*)
		    (t  opengl:*gl-light7*))
	  :position (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   position))
	  :ambient (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   ambient))
	  :diffuse (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   diffuse))
	  :specular (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   specular))
	  :spot-intensity (coerce spot-intensity 'single-float)
	  :spot-direction (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   spot-direction))))

(defclass material ()
 ((face :accessor material-face :initform nil :initarg :face)
  (ns :accessor material-ns :initform nil :initarg :ns)
  (ni :accessor material-ni :initform nil :initarg :ni)
  (d :accessor material-d :initform nil :initarg :d)
  (illum :accessor material-illum :initform nil :initarg :illum)
  (map-kd :accessor material-map-kd :initform nil :initarg :map-kd)
  (ambient :accessor material-ambient :initform nil :initarg :ambient)
  (diffuse :accessor material-diffuse :initform nil :initarg :diffuse)
  (emission :accessor material-emission :initform nil :initarg :emission)
  (shininess :accessor material-shininess :initform nil :initarg :shininess)
  (specular :accessor material-specular :initform nil :initarg :specular)))

(defun make-material (ambient diffuse specular shininess emission)
  (make-instance 'material
        :face opengl:*gl-front-and-back*
	:ambient (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   ambient))
	:diffuse (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   diffuse))
	:specular (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   specular))
	:shininess (coerce shininess 'single-float)
	:emission (apply #'gl-single-vector (mapcar #'(lambda (n) 
						       (coerce n 'single-float))
						   emission))))
	
