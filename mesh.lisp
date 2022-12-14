(in-package #:cl-game-models)

(defclass meshes () 
  ((num-of-meshes :accessor meshes-count :initform nil :initarg :num-of-meshes)
   (meshes :accessor meshes-list :initform nil :initarg :meshes)))

(defclass md5meshes (meshes)
  ((version :accessor md5mesh-version :initform nil)
   (num-of-joints :accessor md5mesh-njoints :initform nil)
   (joints :accessor md5mesh-joints :initform nil)))

(defclass joint ()
  ((name :accessor joint-name :initform nil)
   (id :accessor joint-id :initform nil)
   (position :accessor joint-position :initform nil)
   (orientation :accessor joint-orientation :initform nil)
   (flags :accessor joint-flags :initform nil)
   (start-index :accessor joint-sindex :initform nil)
   (parent-id :accessor joint-parent-id :initform nil)))

(defclass vec ()
  ((x :accessor vec-x :initarg :x :initform nil)
   (y :accessor vec-y :initarg :y :initform nil)
   (z :accessor vec-z :initarg :z :initform nil)
   (w :accessor vec-w :initarg :w :initform nil)))

(defclass axis-box ()
  ((min :accessor min-box :initarg :min :initform nil)
   (max :accessor max-box :initarg :max :initform nil)))

(defclass mesh ()
 ((name :accessor mesh-name :initform nil)
  (texture-key :accessor mesh-texture-key :initform nil)
  (texture-keys :accessor mesh-texture-keys :initform nil)
  (orig-vertexes :accessor mesh-orig-vertexes :initform nil)
  (orig-triangles :accessor mesh-orig-triangles :initform nil)
  (orig-textures :accessor mesh-orig-textures :initform nil)
  (orig-normals :accessor mesh-orig-normals :initform nil) 
  (texture :accessor mesh-texture :initform nil)
  (texture-id :accessor mesh-texture-id :initform nil)
  (texture-buffer-id :accessor mesh-texture-buffer-id :initform nil)
  (vertex-buffer-id :accessor mesh-vertex-buffer-id :initform nil)
  (normal-buffer-id :accessor mesh-normal-buffer-id :initform nil)
  (index-buffer-id :accessor mesh-index-buffer-id :initform nil)
  (num-of-vertices :accessor mesh-nvertices :initform nil)
  (vertices :accessor mesh-vertices :initform nil)
  (indices :accessor mesh-indices :initform nil)
  (axis-box :accessor mesh-axis-box :initform nil :initarg :axis-box)
  (origin-tranlsation :accessor mesh-origin-translation :initform nil :initarg :origin-translation)
  (frame-translation :accessor mesh-frame-translation :initform nil :initarg :frame-translation)
  (bat-location :accessor mesh-bat-location :initform nil :initarg :mesh-bat-location)
  (left-palm-location :accessor mesh-left-palm-location :initform nil 
                      :initarg :mesh-left-palm-location)
  (right-palm-location :accessor mesh-right-palm-location :initform nil 
                       :initarg :mesh-right-palm-location)
  (num-of-triangles :accessor mesh-ntriangles :initform nil)
  (triangles :accessor mesh-triangles :initform nil)
  (line-color :accessor mesh-line-color :initarg :line-color :initform '(1.0 1.0 1.0))
  (line-width :accessor mesh-line-width :initarg :line-width :initform 2.0)
  (gl-vertices :accessor mesh-gl-vertices :initform nil)
  (gl-normals :accessor mesh-gl-normals :initform nil)
  (indices-length :accessor mesh-indices-length :initform nil) 
  (gl-indices :accessor mesh-gl-indices :initform nil)
  (gl-texels :accessor mesh-gl-texels :initform nil)
  (vbo-buffers :accessor mesh-vbo-buffers :initform nil)
  (texture-buffers :accessor mesh-texture-buffers :initform nil)))

(defclass md5mesh (mesh)
 ((shader :accessor mesh-shader :initform nil)
  (num-of-weights :accessor mesh-nweights :initform nil)
  (weights :accessor mesh-weights :initform nil)
  (total-frames :accessor mesh-total-frames :initform 0)
  (mesh-frames :accessor mesh-frames :initform (make-hash-table))))

(defclass wfmesh (mesh) ())

(defclass mesh-vertex ()
 ((id :accessor vertex-id :initform nil)
  (scaled-index :accessor vertex-scaled-index :initform nil)
  (original-index :accessor vertex-original-index :initform nil)
  (vec :accessor vertex-pos :initarg :vertex-pos :initform nil)
  (surface-normals :accessor vertex-surface-normals :initform nil)
  (normal :accessor vertex-normal :initform nil)
  (texuv :accessor vertex-texuv :initform nil)
  (sw :accessor vertex-sw :initform nil)
  (cw :accessor vertex-cw :initform nil)))

(defclass tex-uv ()
  ((u :accessor tex-u :initform nil)
   (v :accessor tex-v :initform nil)))

(defclass mesh-triangle ()
  ((id :accessor triangle-id :initform nil)
   (vertex1 :accessor triangle-v1 :initform nil)
   (vertex2 :accessor triangle-v2 :initform nil)
   (vertex3 :accessor triangle-v3 :initform nil)))

(defclass mesh-weight ()
  ((id :accessor weight-id :initform nil)
   (joint :accessor weight-joint :initform nil)
   (bias :accessor weight-bias :initform nil)
   (pos :accessor weight-pos :initform nil)))
