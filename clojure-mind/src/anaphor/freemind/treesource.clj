; Copyright (c) David N Main. All rights reserved

(ns #^{:doc    "Functions for extracting Clojure source from a mindmap tree"
       :author "Nick Main"}
  anaphor.freemind.treesource
  (:use anaphor.freemind.mindmap))

; start and end delimeters for compound forms
(def form-delimiters {
   "#{"  "}"
   "#^{" "}"
   "#("  ")"
   "'("  ")"
   "`("  ")"
   "("   ")"
   "{"   "}"
   "["   "]"})

; get the form terminator(s) - empty-string if not needed
(defn form-terminator [text] 
  (if (.startsWith text ";") ""  ;comments are not terminated
    (let [end-matches (filter #(.endsWith text %) (keys form-delimiters))
          beg-keys    (filter #(.startsWith text %) (keys form-delimiters))
          beg-matches (filter #(not (.endsWith text (form-delimiters %))) beg-keys)]
      (if (form-delimiters text)
        (form-delimiters (first end-matches) ) ;entire text is one delim
        (str
          (form-delimiters (first end-matches))
          (form-delimiters (first beg-matches)))))))

; get the source from a sub-tree
(defn get-source [node]
  (let [linked-node  (local-link node)
        linkfile-src (file-link node)]
    (if linked-node
      (get-source linked-node)
      (if linkfile-src linkfile-src
        (let [text (.trim (node-text node))
              terminator (form-terminator text)]
          (if (.startsWith text "//") ""
            (str
              text
              (if (.startsWith text ";") "\n"
                (if (= 0 (.length text)) "" " "))
              (apply str (map get-source (node-children node)))
              terminator )))))))

