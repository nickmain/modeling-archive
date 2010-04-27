; Copyright (c) David N Main. All right reserved

(ns #^{:doc    "Functions for manipulating a Freemind mindmap"
       :author "Nick Main"}
  anaphor.freemind.mindmap)

; tell the controller to refresh an updated node
(defn refresh-node [node]
  (.. node (getMap) (getModeController) (nodeRefresh node)))

; set text of a node
(defn set-node-text [node text]
  (.setText node text)
  (refresh-node node))

; append a new child node
(defn create-kid [node text]
  (let [controller (.. node (getMap) (getModeController))]
    (let [new-node (.addNewNode controller node (.getChildCount node) false )]
    (set-node-text new-node text))))

; append a number of child nodes
(defn create-kids [node texts]
  (if (string? texts)
    (create-kid node texts)
    (if (not-empty texts)
      (do 
        (create-kid node (first texts))
        (recur node (rest texts))))))

