; Copyright (c) David N Main. All right reserved

(ns #^{:doc    "Handler functions for mindmap commands"
       :author "Nick Main"}
  anaphor.freemind.clojuremind
  (:use anaphor.freemind.mindmap))

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
        nil))))

(defn eval-node-above [node]
  (let [above (node-above node)]
    (if above
      (eval-string (node-and-child-text above))
      "NO NODE ABOVE")))

(defn eval-parent-node [node]
  (eval-string (.. node (getParentNode) (getText))))

; eval script and explode seq result as kids of node
(defn eval-and-explode [node script-node max-size]
  (let [script (.getText script-node)]
    (try 
      (let [result (load-string script)]
        (if (seq? result)
          (do 
            (doseq [res (take max-size result)] (create-kid node (str res)))
            (set-node-text node "["))
          (set-node-text node (str result))))
      (catch Exception ex (set-node-text node (.getMessage ex))))))

(defn handle-node-update [node]
  (let [text (.getText node)]
    (cond (= text "?"   ) (set-node-text node (eval-parent-node node))
          (= text "??"  ) (set-node-text node (eval-node-above node))
          (= text "???" ) (set-node-text node (node-and-child-text (node-above node)))
          (= text "?>"  ) (eval-and-explode node (.getParentNode node) 30)
          (= text "?>>" ) (eval-and-explode node (.getParentNode node) 100)
          (= text "?>>>") (eval-and-explode node (.getParentNode node) 1000))))

;----------------------------------------------------------------
; Entry points - called by the ClojureRegistration tree listener

(defn on-node-change [updated-node] (handle-node-update updated-node) )

;----------------------------------------------------------------
; Entry points - called by the ClojureNodeHook 

(defn on-select-hook [ hook-node node-view ] nil)
(defn on-deselect-hook [ hook-node node-view ] nil)
(defn on-view-created-hook [ hook-node node-view ] nil)
(defn on-view-removed-hook [ hook-node node-view ] nil)
(defn on-update-hook [ hook-node ] nil)
(defn on-add-child-hook [ hook-node added-node ] nil)
(defn on-new-child-hook [ hook-node new-node ] nil)
(defn on-add-descendant-hook [ hook-node added-node ] nil)
(defn on-remove-child-hook [ hook-node old-child-node ] nil)
(defn on-remove-descendant-hook [ hook-node old-child-node old-parent-node ] nil)
(defn on-update-descendant-hook [ hook-node updated-node ] nil)
(defn on-save-hook [ hook-node hookElement ] nil)
(defn on-load-hook [ hook-node hookElement ] nil)
