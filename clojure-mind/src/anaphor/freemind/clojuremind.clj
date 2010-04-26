; Copyright (c) David N Main. All right reserved

(ns anaphor.freemind.clojuremind)

(defn set-node-text [controller node text]
    (.setText node text)
    (.nodeRefresh controller node))

(defn create-kid [controller node text]
  (let [new-node (.addNewNode controller node (.getChildCount node) false )]
    (set-node-text controller new-node text)))

(defn create-kids [controller node texts]
  (if (string? texts)
    (create-kid controller node texts)
    (if (not-empty texts)
      (do 
        (create-kid controller node (first texts))
        (recur controller node (rest texts))))))

(defn eval-string [s] 
  (try (str (load-string s))  
    (catch Exception ex (.getMessage ex))))

; gather text of a node and all descendants
(defn node-and-child-text [node]
  (str 
    (.getText node) 
    " "
    (apply str (map node-and-child-text (.getChildren node)))))

(defn node-above [node]
  (let [parent (.getParentNode node)]
    (let [posn (.getChildPosition parent node)]
      (if (> posn 0)
        (.. parent (getChildren) (get (- posn 1)))
        nil)) 
    ))

(defn eval-node-above [node]
  (let [above (node-above node)]
    (if above
      (eval-string (node-and-child-text above))
      "NO NODE ABOVE")))

(defn eval-parent-node [node]
  (eval-string (.. node (getParentNode) (getText))))

(defn handle-node-update [controller node]
  (let [text (.getText node)]
      (cond (= text "?" ) (set-node-text controller node (eval-parent-node node))
            (= text "??") (set-node-text controller node (eval-node-above node))
            (= text "???") (set-node-text controller node (node-and-child-text (node-above node))))))

;-------------------------------------------------------
; Entry points - called by the ClojureRootNodeHook

(defn on-node-change [controller updated-node] (handle-node-update controller updated-node) )
