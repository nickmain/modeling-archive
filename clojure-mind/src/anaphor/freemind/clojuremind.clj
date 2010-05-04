; Copyright (c) David N Main. All right reserved

(ns #^{:doc    "Handler functions for mindmap commands"
       :author "Nick Main"}
  anaphor.freemind.clojuremind
  (:use anaphor.freemind.mindmap)
  (:use anaphor.freemind.treesource))

(def warning-icon (freemind-icon "messagebox_warning"))
(def ok-icon      (freemind-icon "button-ok"))

; set node text in red with a warning icon
(defn set-error-text! [node text] (set-node-text! node text 16rff0000 warning-icon))

; evaluate text of a node and add error child if needed
(defn eval-init-node [node]
  (let [script (get-source node)]
    (try
      (load-string script)
      (catch Exception ex 
        (set-error-text! (create-kid! node "") (.getMessage ex))))))

; evaluate a string and put the result in the given node
(defn eval-string [s node] 
  (try (set-node-text! node (str (load-string s)))   
    (catch Exception ex (set-error-text! node (.getMessage ex)))))

; evaluate the source from the node above and place in the node
(defn eval-node-above [node]
  (let [above (node-above node)]
    (if above
      (eval-string (get-source above) node)
      (set-error-text! node "NO NODE ABOVE"))))

; evaluate the text in the parent node and put the result in the node
(defn eval-parent-node [node]
  (let [parent (parent-node node)
        grandpa (parent-node parent)]    
    (eval-string 
      (str
        ; look for and include a namespace def in the grandparent
        (if (and grandpa 
              (.startsWith (.trim (node-text grandpa)) "(ns ")) 
          (node-text grandpa))
        (node-text parent)) 
      node) ))

; eval script and explode under node with limit
(defn eval-explode-string [script node max-size]
  (try 
    (let [result (load-string script)]
      (if (seq? result)
        (do 
          (doseq [res (take max-size result)] (create-kid! node (str res)))
          (set-node-text! node "["))
        (set-node-text! node (str result))))
    (catch Exception ex (set-error-text! node (.getMessage ex)))))

; eval/explode parent node
(defn eval-explode-parent [node max-size]
  (eval-explode-string (node-text (parent-node node)) node max-size))

; eval/explode node above
(defn eval-explode-above [node max-size]
  (let [above (node-above node)]
    (if above
      (eval-explode-string (get-source above) node max-size)
      (set-error-text! node "NO NODE ABOVE"))))

; set up a script node linked from the parent
(defn setup-hook [node]
  (let [parent (parent-node node)]
    (.setLink parent (str "#" (.. node (getModeController) (getNodeID node))))
    (set-node-text! node "#script")
    (refresh-node! parent)))


(def command-map {
  "?"     eval-parent-node
  "??"    eval-node-above
  "???"   #(set-node-text! % (get-source (node-above %)))
  
  "?>"    #(eval-explode-parent % 30)
  "?>>"   #(eval-explode-parent % 100)
  "?>>>"  #(eval-explode-parent % 1000)
  
  "??>"   #(eval-explode-above % 30)
  "??>>"  #(eval-explode-above % 100)
  "??>>>" #(eval-explode-above % 1000)
  
  "/hook" #(setup-hook %)
  
  ;----for experimentation:
  "/test" (fn [node] (set-node-text! node (apply str (map #(.getName %) (.getIcons (parent-node node))))))
  
})

;----------------------------------------------------------------
; Entry point - called by the ClojureRegistration tree listener

(defn on-node-change [updated-node] 
  (let [handler (command-map (node-text updated-node))]
    (if handler
      (handler updated-node))))

(defn init-node [node] (eval-init-node node))

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
