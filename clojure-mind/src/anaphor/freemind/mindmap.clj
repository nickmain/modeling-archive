; Copyright (c) David N Main. All right reserved

(ns #^{:doc    "Functions for accessing and manipulating a Freemind mindmap"
       :author "Nick Main"}
  anaphor.freemind.mindmap)

; get the locally linked node, nil if none
(defn local-link [node]
  (let [link (.getLink node)]
    (if link
      (if (.startsWith link "#") 
        (.. node (getModeController) (getNodeFromID (.substring link 1)))))))

; get a File with name relative to the mindmap of the node
(defn relative-file [node filename]
  (let [mm-file (.. node (getMap) (getFile))]
    (java.io.File. (.getParentFile mm-file) filename)))

; get a File linked from node - nil if none
(defn linked-file [node]
  (let [link (.getLink node)]
    (if link
      (if (or (.startsWith link "#") (.startsWith link "http:")) 
        nil
        (relative-file node link)))))

; get the text from a linked file, nil if no link
(defn file-link [node]
  (let [file (linked-file node)]
    (if file 
      (anaphor.freemind.util.FileUtils/readFile file))))

; get the children of a node
(defn node-children [node] (.getChildren node))

; get the parent of a node
(defn parent-node [node] (.getParentNode node))

; get the text of a node
(defn node-text [node] (.getText node))

; tell the controller to refresh an updated node
(defn refresh-node! [node]
  (.. node (getMap) (getModeController) (nodeRefresh node)))

; set text of a node
(defn set-node-text! 
  ([node text]       (set-node-text! node text 0 nil))
  ([node text color] (set-node-text! node text color nil))
  ([node text color error-icon]
    (.setText node text)
    (.setStateIcon node "error" error-icon)
    (.setColor node (java.awt.Color. color))
    (refresh-node! node)))

; get an icon
(defn freemind-icon [icon-name] 
  (.getIcon (freemind.modes.MindIcon/factory icon-name)))

; set text and background of a node
(defn set-node-text-bg! [node text color]
  (.setText node text)
  (.setBackgroundColor node (java.awt.Color. color))
  (refresh-node! node))

; set background color of a node
(defn set-node-bg! [node color]
  (.setBackgroundColor node (java.awt.Color. color))
  (refresh-node! node))

; append a new child node and return
(defn create-kid! [node text]
  (let [controller (.. node (getMap) (getModeController))]
    (let [new-node (.addNewNode controller node (.getChildCount node) (.isLeft node) )]
      (set-node-text! new-node text)
      new-node)))

; append a number of child nodes
(defn create-kids! [node texts]
  (if (string? texts)
    (create-kid! node texts)
    (if (not-empty texts)
      (do 
        (create-kid! node (first texts))
        (recur node (rest texts))))))

; get the node above - nil if none
(defn node-above [node]
  (let [parent (.getParentNode node)]
    (let [posn (.getChildPosition parent node)]
      (if (> posn 0)
        (.. parent (getChildren) (get (- posn 1)))
        nil))))