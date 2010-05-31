; Copyright (c) David N Main. All rights reserved

(ns #^{:doc    "Functions for handling HTTP requests"
       :author "Nick Main"}
  anaphor.freemind.http
  (:use anaphor.freemind.mindmap)
  (:use anaphor.freemind.treesource))

; make a request map
(defn make-req-map [node uri method header-map param-map] 
  {:node    node
   :uri     uri
   :method  method
   :headers header-map
   :params  param-map })

; handle request
(defn handle-req [handler view node uri method header-map param-map]
  (let [req (make-req-map node uri method header-map param-map)]
    (view (handler req) req)))

; minimal HTML wrapper
(defn basic-html [title & body]
  (str
    "<html><head><title>"
    title
    "</title></head><body>"
    (apply str body)
    "</body></html>"))

; make a table from a map
(defn map2table [m]
  (str
    "<table border='0' cellpadding='3' cellspacing='1' >"
    (apply str 
      (map #(str 
              "<tr><td bgcolor='#dddddd'>" 
              (key %) 
              "</td><td bgcolor='#aaffff'>" 
              (val %) 
              "</td></tr>") 
        (dissoc m)))
    "</table>"))

; the default HTTP handler
(defn default-handler [req]
  "Hello World")

; the default view
(defn default-view [data req]
  (basic-html "Test Page"
    "<p>Result: " (str data) "</p>"
    "<hr /><p>Parameters:</p>"
    (map2table (req :params))
    "<hr /><p>Headers:</p>"
    (map2table (req :headers))))
