; Copyright (c) David N Main. All rights reserved

(ns #^{:doc    "Omnigraffle Diagram Parser"
       :author "Nick Main"}
  anaphor.graffle.ogparser
  (:use anaphor.graffle.plist))


; convert RTF to plain text
(defn un-rtf [rtf]
  (if rtf
    (let [doc (javax.swing.text.DefaultStyledDocument.)
          kit (javax.swing.text.rtf.RTFEditorKit.)
          src (java.io.StringReader. rtf)]
      (do
        (.read kit src doc 0)
        (.trim (.getText doc 0 (.getLength doc)))))))

; get stroke attribute
(defn stroke-attr [g attr]
  (let [style (:Style g)]
    (if style
      (let [stroke (:stroke style)]
        (if stroke
          (attr stroke))))))

; whether stroke is dashed
(defn dashed? [g]
  (if (-> g :Style :stroke :Pattern) 
    true))

; get shape bounds as a Rectangle2D
(defn bounds [g]
  (let [bnds (:Bounds g)]
    (if bnds
      (let [tok (java.util.StringTokenizer. bnds " {},")
            nxt #(Double/parseDouble (.nextToken tok))]
        (java.awt.geom.Rectangle2D$Double. (nxt) (nxt) (nxt) (nxt))))))

; get table rows
(defn table-rows [g] 
  (if (= :TableGroup (keyword (:Class g)))
    (map 
      vals 
      (vals
        (reduce 
          (fn [tm [id bounds]] 
            (let [rm      (tm (.getY bounds))
                  row-map (assoc (if rm rm (sorted-map)) (.getX bounds) id)]
              (assoc tm (.getY bounds) row-map))) 
          (sorted-map)
          (map (fn [g2] [(:ID g2) (bounds g2)]) (:Graphics g)))))))

; make a graphic map
(defn make-graphic [g]
  {:id      (:ID g)
   :notes   (un-rtf (:Notes g))
   :shape   (:Shape g)
   :dashed? (dashed? g)
   :type    (keyword (:Class g))  ; :ShapedGraphic, :LineGraphic, :TableGroup or :Group
   :text    (un-rtf (-> g :Text :Text))
   :bounds  (bounds g)
   
   ; groups
   :subgraph? (:isSubgraph g)
   :graphics  (let [gs (:Graphics g)] (if gs (map make-graphic gs) []))
   :rows      (table-rows g)
   
   ; lines / 1D shapes
   :head-arrow (-> g :Style :stroke :HeadArrow)
   :tail-arrow (-> g :Style :stroke :TailArrow)
   :head-id    (-> g :Head :ID)
   :tail-id    (-> g :Tail :ID)
   
   ; line labels
   :label-for (-> g :Line :ID)
   :label-pos (-> g :Line :Position)})

; make a sheet map
(defn make-sheet [plist-map]
  {:id    (:UniqueID plist-map)
   :title (:SheetTitle plist-map)
   :notes (un-rtf (:Notes (:BackgroundGraphic plist-map)))
   :graphics (map make-graphic (:GraphicsList plist-map))})

(defn og-sheets [plist]
  "Get the sheets/pages from an Omnigraffle plist"
  (let [sheet-list (plist :Sheets)]
    (if sheet-list
      (map make-sheet sheet-list)
      
      ;if there is no sheets list then entire plist is the single sheet
      [(make-sheet plist)])))

(defn og-diagram [file]
  "Get a map representing an Omnigraffle document"
  (let [plist (parse-plist file)]
    {:file (.getAbsolutePath file)
     :sheets (og-sheets plist)
     :comments      (-> plist :UserInfo :kMDItemComments)
     :copyright     (-> plist :UserInfo :kMDItemCopyright)
     :description   (-> plist :UserInfo :kMDItemDescription)
     :subject       (-> plist :UserInfo :kMDItemSubject)
     :version       (-> plist :UserInfo :kMDItemVersion)
     :authors       (-> plist :UserInfo :kMDItemAuthors)
     :keywords      (-> plist :UserInfo :kMDItemKeywords)
     :languages     (-> plist :UserInfo :kMDItemLanguages)
     :organizations (-> plist :UserInfo :kMDItemOrganizations)
     :projects      (-> plist :UserInfo :kMDItemProjects)}))
