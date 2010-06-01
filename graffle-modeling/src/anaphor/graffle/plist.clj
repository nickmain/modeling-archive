; Copyright (c) David N Main. All rights reserved

(ns #^{:doc    "PLIST parser"
       :author "Nick Main"}
  anaphor.graffle.plist  
  (:require clojure.xml))

; date format used in PLISTs
(def plist-date-format 
  (java.text.SimpleDateFormat. "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'" ))

; process an xml element
(defn process-element [elem handler-map]
  (let [handler ((:tag elem) handler-map)]
    (if handler
      (handler elem handler-map))))

; map of handler fns for element types
(def elem-handler-map 
  {:array (fn [e hm] (map #(process-element % hm) (:content e)))
   :dict  (fn [e hm] (reduce 
                       (fn [m [{[k] :content} e2]] 
                         (assoc m (keyword k) (process-element e2 hm))) 
                       (hash-map) 
                       (partition 2 (:content e))))
   :integer (fn [{[v] :content} hm] (Integer/parseInt (.trim v)))
   :plist   (fn [{[e] :content} hm] (process-element e hm))
   :string  (fn [{[s] :content} hm] s)
   :true    (fn [e hm] true)
   :false   (fn [e hm] false)
   :real    (fn [{[v] :content} hm] (Double/parseDouble (.trim v)))
   :data    (fn [e hm] :unimplemented-data)
   :date    (fn [{[v] :content} hm] (.parse plist-date-format (.trim v)))})

(defn parse-plist [file]
  "Parse a PLIST file and return as a map of maps"
  (if (.isDirectory file)
    (parse-plist (java.io.File. file "data.plist")) ; compound plist
    (process-element (clojure.xml/parse file) elem-handler-map)))
