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

; get the eval text from parent - include grand-parent if namespace decl
(defn parent-eval-text [node]
  (let [parent (parent-node node)
        grandpa (parent-node parent)]
      (str
        ; look for and include a namespace def in the grandparent
        (if (and grandpa 
              (.startsWith (.trim (node-text grandpa)) "(ns ")) 
          (node-text grandpa))
        (node-text parent))))

; evaluate the text in the parent node and put the result in the node
(defn eval-parent-node [node] 
  (eval-string 
    (parent-eval-text node) 
    node))

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
  (eval-explode-string (parent-eval-text node) node max-size))

; eval/explode node above
(defn eval-explode-above [node max-size]
  (let [above (node-above node)]
    (if above
      (eval-explode-string (get-source above) node max-size)
      (set-error-text! node "NO NODE ABOVE"))))

; save source pointed at by a node to file named in text
(defn save-node-file [node]
  (let [script (get-source node)
        filename (node-text node)
        file (relative-file node filename)]
    (with-open [writer (java.io.FileWriter. file)]
      (.write writer script))))

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
  
  ;----for experimentation:
  "/test" (fn [node] (set-node-text! node (apply str (map #(.getName %) (.getIcons (parent-node node))))))
  
})

;----------------------------------------------------------------
; Entry points called from Java

(defn on-node-change [updated-node] 
  (let [handler (command-map (node-text updated-node))]
    (if handler
      (handler updated-node))))

(defn init-node [node] (eval-init-node node))

(defn save-node [node] (save-node-file node))

;----------------------------------------------------------------
; Default node hook 

(defn node-hook [ hook-node changed-node parent-node is-add ] 
  (cond
    (= hook-node changed-node) nil    
    is-add      (set-node-text! hook-node (str "Child added =>\n"   (node-text changed-node)))
    parent-node (set-node-text! hook-node (str "Child removed =>\n" (node-text changed-node)))
    true        (set-node-text! hook-node (str "Child update =>\n"  (node-text changed-node)))))