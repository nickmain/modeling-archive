<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1271265931415" ID="ID_1152169055" MODIFIED="1271450993020" TEXT="Clojure">
<edge STYLE="bezier"/>
<node CREATED="1271265941840" ID="ID_140162490" MODIFIED="1272167155602" POSITION="right" TEXT="Reader">
<node CREATED="1271267982888" FOLDED="true" ID="ID_1028607641" MODIFIED="1272167152290" TEXT="Forms">
<node CREATED="1271267663513" ID="ID_1766286914" MODIFIED="1271267856416" TEXT="Symbols"/>
<node CREATED="1271267672859" ID="ID_314451080" MODIFIED="1271267856415" TEXT="Literals">
<node CREATED="1271267691297" ID="ID_1958865324" MODIFIED="1271267856415" TEXT="Strings"/>
<node CREATED="1271267695799" ID="ID_1097082940" MODIFIED="1271267856414" TEXT="Numbers"/>
<node CREATED="1271267700491" ID="ID_1410592991" MODIFIED="1271267856414" TEXT="Characters"/>
<node CREATED="1271267712664" ID="ID_468685606" MODIFIED="1271267856413" TEXT="nil"/>
<node CREATED="1271267721573" ID="ID_1668223197" MODIFIED="1271267856413" TEXT="Booleans"/>
<node CREATED="1271267726394" ID="ID_1343795372" MODIFIED="1271267856412" TEXT="Keywords"/>
</node>
<node CREATED="1271267731068" ID="ID_1623352589" MODIFIED="1271267856412" TEXT="Lists">
<node CREATED="1271267808834" ID="ID_700739611" MODIFIED="1271268276032" TEXT="(a b c)">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271267738764" ID="ID_1434007477" MODIFIED="1271267856411" TEXT="Vectors">
<node CREATED="1271267816581" ID="ID_1352478883" MODIFIED="1271268276033" TEXT="[1 2 3]">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271267760958" ID="ID_1623869524" MODIFIED="1271267856410" TEXT="Maps">
<node CREATED="1271267828235" ID="ID_1264538861" MODIFIED="1271268276033" TEXT="{:a 1 :b 2}">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271267768956" ID="ID_1343892325" MODIFIED="1271267856409" TEXT="Sets">
<node CREATED="1271267844189" ID="ID_1944446401" MODIFIED="1271268276033" TEXT="#{:a :b :c}">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271267876056" ID="ID_1779692037" MODIFIED="1271267881425" TEXT="Macro Chars">
<node CREATED="1271267903695" ID="ID_1686833023" MODIFIED="1271268248376" TEXT="Quote (&apos;)">
<node CREATED="1271267912582" ID="ID_732711108" MODIFIED="1271268276033" TEXT="&apos;form =&gt; (quote form)">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271267920176" ID="ID_449255232" MODIFIED="1271268248374" TEXT="Character (\)"/>
<node CREATED="1271267927128" ID="ID_1589042628" MODIFIED="1271268248374" TEXT="Comment (;)"/>
<node CREATED="1271267933589" ID="ID_247260960" MODIFIED="1271268248373" TEXT="Deref (@)">
<node CREATED="1271267938021" ID="ID_154342643" MODIFIED="1271268276033" TEXT="@form =&gt; (deref form)">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271268057084" ID="ID_1200540072" MODIFIED="1271268248372" TEXT="Regex patterns (#&quot;pattern&quot;)"/>
<node CREATED="1271268091844" ID="ID_1476880932" MODIFIED="1271268248372" TEXT="Metadata (#^)">
<node CREATED="1271268105299" ID="ID_909981400" MODIFIED="1271268276033" TEXT="#^String x is the same as #^{:tag String} x">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271268118666" ID="ID_224144668" MODIFIED="1271268248371" TEXT="Var-quote (#&apos;)">
<node CREATED="1271268129133" ID="ID_1049172269" MODIFIED="1271268276033" TEXT="#&apos;x =&gt; (var x)">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
<node CREATED="1271268152404" ID="ID_1862396910" MODIFIED="1271268248370" TEXT="Anonymous function literal (#())">
<node CREATED="1271268159902" ID="ID_975500448" MODIFIED="1271268276033" TEXT="#(...) =&gt; (fn [args] (...))">
<font NAME="Courier" SIZE="12"/>
<node CREATED="1271268204099" ID="ID_1349332336" MODIFIED="1271268276034" TEXT="%, %n or %&amp;">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1271268221181" ID="ID_522122853" MODIFIED="1271268248368" TEXT="Ignore next form (#_)"/>
<node CREATED="1271268335573" ID="ID_1358496559" MODIFIED="1271268434108" TEXT="Syntax-quote (`)">
<node CREATED="1271268352691" ID="ID_1757544429" MODIFIED="1271268413514" TEXT="Unquote (~)"/>
<node CREATED="1271268391955" ID="ID_1791468351" MODIFIED="1271268413514" TEXT="Unquote-splicing (~@)"/>
</node>
</node>
</node>
<node CREATED="1271269552968" FOLDED="true" ID="ID_1172243510" MODIFIED="1272167153352" TEXT="Functions">
<node CREATED="1271269565227" ID="ID_784670001" MODIFIED="1271269624008" TEXT="(read)">
<font NAME="Courier" SIZE="12"/>
</node>
<node CREATED="1271269570353" ID="ID_1440963825" MODIFIED="1271269624007" TEXT="(read stream)">
<font NAME="Courier" SIZE="12"/>
</node>
<node CREATED="1271269578233" ID="ID_1165452540" MODIFIED="1271269624007" TEXT="(read stream eof-is-error)">
<font NAME="Courier" SIZE="12"/>
</node>
<node CREATED="1271269592076" ID="ID_1927522316" MODIFIED="1271269624007" TEXT="(read stream eof-is-error eof-value)">
<font NAME="Courier" SIZE="12"/>
</node>
<node CREATED="1271269598660" ID="ID_73750356" MODIFIED="1271269624007" TEXT="(read stream eof-is-error eof-value is-recursive)">
<font NAME="Courier" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1271266114676" ID="ID_981825161" MODIFIED="1271266117322" POSITION="right" TEXT="REPL">
<node CREATED="1271266117749" ID="ID_1210945968" MODIFIED="1271266123066" TEXT="main"/>
</node>
<node CREATED="1271266157703" FOLDED="true" ID="ID_1011216355" MODIFIED="1272167157231" POSITION="right" TEXT="Special Forms">
<node CREATED="1271267389214" ID="ID_918700401" MODIFIED="1271267612674" TEXT="(def symbol init?)"/>
<node CREATED="1271267412709" ID="ID_1729571187" MODIFIED="1271267612673" TEXT="(if test then else?)"/>
<node CREATED="1271267431874" ID="ID_1576257538" MODIFIED="1271267612673" TEXT="(do exprs*)"/>
<node CREATED="1271267436877" ID="ID_1211483713" MODIFIED="1271267612672" TEXT="(let [bindings* ] exprs*)"/>
<node CREATED="1271267445901" ID="ID_587056995" MODIFIED="1271267612672" TEXT="(quote form)"/>
<node CREATED="1271267456815" ID="ID_1382030438" MODIFIED="1271267612671" TEXT="(var symbol)"/>
<node CREATED="1271267495761" ID="ID_868631022" MODIFIED="1271267497970" TEXT="fn">
<node CREATED="1271267513975" ID="ID_330580996" MODIFIED="1271267612671" TEXT="(fn name? [params* ] condition-map? exprs*)"/>
<node CREATED="1271267521072" ID="ID_507924162" MODIFIED="1271267612670" TEXT="(fn name? ([params* ] condition-map? exprs*)+)"/>
</node>
<node CREATED="1271267538967" ID="ID_1939490841" MODIFIED="1271267612670" TEXT="(loop [bindings* ] exprs*)"/>
<node CREATED="1271267543562" ID="ID_1790300994" MODIFIED="1271267612669" TEXT="(recur exprs*)"/>
<node CREATED="1271267548866" ID="ID_473523124" MODIFIED="1271267612669" TEXT="(throw expr)"/>
<node CREATED="1271267556029" ID="ID_131753136" MODIFIED="1271267612669" TEXT="(try expr* catch-clause* finally-clause?)"/>
<node CREATED="1271267622322" ID="ID_1058152447" MODIFIED="1271267628553" TEXT="monitor">
<node CREATED="1271267569116" ID="ID_244119007" MODIFIED="1271267612668" TEXT="(monitor-enter x)"/>
<node CREATED="1271267573330" ID="ID_1137445087" MODIFIED="1271267612667" TEXT="(monitor-exit x)"/>
</node>
</node>
<node CREATED="1271266163384" ID="ID_214270788" MODIFIED="1271266168293" POSITION="right" TEXT="Macros"/>
<node CREATED="1271266168656" ID="ID_601950643" MODIFIED="1271266176598" POSITION="right" TEXT="Other Functions"/>
<node CREATED="1271266176904" ID="ID_1948006374" MODIFIED="1271266182006" POSITION="right" TEXT="Data Structures"/>
<node CREATED="1271266182496" FOLDED="true" ID="ID_1390094637" MODIFIED="1271441711848" POSITION="right" TEXT="Sequences">
<node CREATED="1271270045519" ID="ID_1948494788" MODIFIED="1271270146660" TEXT="seq">
<node CREATED="1271270059750" ID="ID_441624918" MODIFIED="1271270059750">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(seq coll)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271270085696" ID="ID_1204968390" MODIFIED="1271270126239">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a seq on the collection. If the collection is
empty, returns nil.  (seq nil) returns nil. seq also works on
Strings, native Java arrays (of reference types) and any objects
that implement Iterable.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271270013179" ID="ID_178605431" MODIFIED="1271433688713" TEXT="Seq interface">
<node CREATED="1271270020857" ID="ID_1517169164" MODIFIED="1271274929475" TEXT="(first coll)">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1271270181349" ID="ID_670374146" MODIFIED="1271270181349">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Returns the first item in the collection. Calls seq on its argument. If coll is nil, returns nil.
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271270170449" ID="ID_1329775729" MODIFIED="1271270206639" TEXT="(rest coll)">
<node CREATED="1271270190613" ID="ID_897122472" MODIFIED="1271270190613">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Returns a sequence of the items after the first. Calls seq on its argument. If there are no more items, returns a logical sequence for which <strong>seq</strong> returns nil.
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271270223357" ID="ID_1362670077" MODIFIED="1271270235316" TEXT="(cons item seq)">
<node CREATED="1271270252009" ID="ID_876954404" MODIFIED="1271270252009">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Returns a new seq where item is the first element and seq is the rest.
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274704038" ID="ID_1899485935" MODIFIED="1271274719880" TEXT="Library">
<node CREATED="1271274754196" FOLDED="true" ID="ID_694662130" MODIFIED="1271431464112" TEXT="Seq in, Seq out">
<node CREATED="1271274780273" FOLDED="true" ID="ID_1852483129" MODIFIED="1271275462632">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Shorter seq from a longer seq
  </body>
</html></richcontent>
<node CREATED="1271274952790" ID="ID_1640588108" MODIFIED="1271274952790">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(distinct coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271274962211" ID="ID_401797051" MODIFIED="1271274962211">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of the elements of coll with duplicates removed</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271274974921" ID="ID_214256159" MODIFIED="1271274974921">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(filter pred coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271274981367" ID="ID_277359432" MODIFIED="1271274981367">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of the items in coll for which
(pred item) returns true. pred must be free of side-effects.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275014512" ID="ID_563149133" MODIFIED="1271275014512">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(remove pred coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275022446" ID="ID_1744262110" MODIFIED="1271275022446">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of the items in coll for which
(pred item) returns false. pred must be free of side-effects.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275039395" ID="ID_175735476" MODIFIED="1271275039395">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(for seq-exprs body-expr)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275047474" ID="ID_1812783633" MODIFIED="1271275047474">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">List comprehension. Takes a vector of one or more
 binding-form/collection-expr pairs, each followed by zero or more
 modifiers, and yields a lazy sequence of evaluations of expr.
 Collections are iterated in a nested fashion, rightmost fastest,
 and nested coll-exprs can refer to bindings created in prior
 binding-forms.  Supported modifiers are: :let [binding-form expr ...],
 :while test, :when test.

(take 100 (for [x (range 100000000) y (range 1000000) :while (&lt; y x)] [x y]))</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274786889" FOLDED="true" ID="ID_984694554" MODIFIED="1271276383593">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Longer seq from a shorter seq
  </body>
</html></richcontent>
<node CREATED="1271275146555" ID="ID_1678478246" MODIFIED="1271275163687">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(cons x seq)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275152339" ID="ID_1528876120" MODIFIED="1271275152339">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a new seq where x is the first element and seq is
the rest.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275188099" ID="ID_819241526" MODIFIED="1271275188099">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(concat)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275195757" ID="ID_689422181" MODIFIED="1271275195757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(concat x)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275203556" ID="ID_227880237" MODIFIED="1271275203556">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(concat x y)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275210685" ID="ID_1380044413" MODIFIED="1271275210685">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(concat x y &amp; zs)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275216948" ID="ID_616470879" MODIFIED="1271275216948">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy seq representing the concatenation of the elements in the supplied colls.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275250402" ID="ID_687977733" MODIFIED="1271275250402">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(lazy-cat &amp; colls)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275264031" ID="ID_1593580739" MODIFIED="1271275264031">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Expands to code which yields a lazy sequence of the concatenation
of the supplied colls.  Each coll expr is not evaluated until it is
needed. 

(lazy-cat xs ys zs) === (concat (lazy-seq xs) (lazy-seq ys) (lazy-seq zs))</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275296018" ID="ID_1449725098" MODIFIED="1271275296018">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(mapcat f &amp; colls)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275302282" ID="ID_1605366775" MODIFIED="1271275302282">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns the result of applying concat to the result of applying map
to f and colls.  Thus function f should return a collection.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275368828" ID="ID_1853309173" MODIFIED="1271275368828">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(cycle coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275375011" ID="ID_1035259158" MODIFIED="1271275375011">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy (infinite!) sequence of repetitions of the items in coll.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275388663" ID="ID_1553245220" MODIFIED="1271275388663">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(interleave c1 c2)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275394084" ID="ID_1340301701" MODIFIED="1271275394084">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(interleave c1 c2 &amp; colls)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275400202" ID="ID_1653336180" MODIFIED="1271275400202">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy seq of the first item in each coll, then the second etc.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275419658" ID="ID_1272476629" MODIFIED="1271275419658">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(interpose sep coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275425893" ID="ID_24013396" MODIFIED="1271275425893">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy seq of the elements of coll separated by sep</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274793841" ID="ID_1654622638" MODIFIED="1271274793841">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Seq with head-items missing
  </body>
</html></richcontent>
<node CREATED="1271275500327" ID="ID_1136070308" MODIFIED="1271275500327">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(next coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275517494" ID="ID_318448706" MODIFIED="1271275517494">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a seq of the items after the first. Calls seq on its
argument.  If there are no more items, returns nil.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275540282" ID="ID_322567718" MODIFIED="1271275540282">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(fnext x)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275547011" ID="ID_633637734" MODIFIED="1271275547011">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Same as (first (next x))</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275564510" ID="ID_1794847978" MODIFIED="1271275564510">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(nnext x)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275568336" ID="ID_1802317876" MODIFIED="1271275568336">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Same as (next (next x))</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275593438" ID="ID_1355585307" MODIFIED="1271275593438">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(drop n coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275599696" ID="ID_1030711689" MODIFIED="1271275599696">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of all but the first n items in coll.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275615824" ID="ID_1685901079" MODIFIED="1271275615824">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(drop-while pred coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275621254" ID="ID_469852154" MODIFIED="1271275621254">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of the items in coll starting from the first
item for which (pred item) returns nil.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275645418" ID="ID_393024635" MODIFIED="1271275645418">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(nthnext coll n)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275653496" ID="ID_711665214" MODIFIED="1271275653496">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns the nth next of coll, (seq coll) when n is 0.</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274800058" ID="ID_1798761343" MODIFIED="1271274800058">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Seq with tail-items missing
  </body>
</html></richcontent>
<node CREATED="1271275687763" ID="ID_1211127962" MODIFIED="1271275687763">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(take n coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275691820" ID="ID_989159481" MODIFIED="1271275691820">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of the first n items in coll, or all items if
there are fewer than n.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275705558" ID="ID_1274910767" MODIFIED="1271275705558">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(take-nth n coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275711645" ID="ID_1118080724" MODIFIED="1271275711645">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy seq of every nth item in coll.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275721098" ID="ID_920727655" MODIFIED="1271275721098">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(take-while pred coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275728915" ID="ID_152088521" MODIFIED="1271275728915">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of successive items from coll while
(pred item) returns true. pred must be free of side-effects.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275747519" ID="ID_1135175096" MODIFIED="1271275747519">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(butlast coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275754026" ID="ID_1444544370" MODIFIED="1271275754026">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Return a seq of all but the last item in coll, in linear time</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275771471" ID="ID_297523107" MODIFIED="1271275771471">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(drop-last s)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275778538" ID="ID_1897154981" MODIFIED="1271275778538">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(drop-last n s)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275786468" ID="ID_1998189949" MODIFIED="1271275786468">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Return a lazy sequence of all but the last n (default 1) items in coll</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274806329" ID="ID_347839219" MODIFIED="1271274806329">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Rearrangment of a seq
  </body>
</html></richcontent>
<node CREATED="1271275803020" ID="ID_68703379" MODIFIED="1271275803020">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(reverse coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275808521" ID="ID_57108314" MODIFIED="1271275808521">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a seq of the items in coll in reverse order. Not lazy.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275910472" ID="ID_1995043742" MODIFIED="1271275910472">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(sort coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275926393" ID="ID_1016691427" MODIFIED="1271275926393">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(sort comp coll)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275933177" ID="ID_128235177" MODIFIED="1271275933177">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a sorted sequence of the items in coll. If no comparator is
supplied, uses compare. comparator must
implement java.util.Comparator.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271275827028" ID="ID_889223059" MODIFIED="1271275827028">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(sort-by keyfn coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271275833056" ID="ID_1802525995" MODIFIED="1271275833056">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(sort-by keyfn comp coll)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271275838225" ID="ID_245772892" MODIFIED="1271275838225">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a sorted sequence of the items in coll, where the sort
order is determined by comparing (keyfn item).  If no comparator is
supplied, uses compare. comparator must
implement java.util.Comparator.</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274812656" ID="ID_1245244017" MODIFIED="1271274812656">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Create nested seqs
  </body>
</html></richcontent>
<node CREATED="1271276006499" ID="ID_1479144756" MODIFIED="1271276006499">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(split-at n coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276012710" ID="ID_255253976" MODIFIED="1271276012710">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a vector of [(take n coll) (drop n coll)]</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271276045903" ID="ID_1868229325" MODIFIED="1271276045903">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(split-with pred coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276057173" ID="ID_1351833946" MODIFIED="1271276057173">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a vector of [(take-while pred coll) (drop-while pred coll)]</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271276107430" ID="ID_1558502361" MODIFIED="1271276107430">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(partition n coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276113226" ID="ID_1234030524" MODIFIED="1271276113226">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(partition n step coll)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276118648" ID="ID_1754157360" MODIFIED="1271276118648">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(partition n step pad coll)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276129383" ID="ID_1658527925" MODIFIED="1271276129383">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence of lists of n items each, at offsets step
apart. If step is not supplied, defaults to n, i.e. the partitions
do not overlap. If a pad collection is supplied, use its elements as
necessary to complete last partition upto n items. In case there are
not enough padding elements, return a partition with less than n items.</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271274820216" ID="ID_1412099079" MODIFIED="1271274820216">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Process each item of a seq to create a new seq
  </body>
</html></richcontent>
<node CREATED="1271276209395" ID="ID_1390727410" MODIFIED="1271276209395">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(map f coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276229896" ID="ID_174211786" MODIFIED="1271276229896">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(map f c1 c2)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276234317" ID="ID_165524130" MODIFIED="1271276234317">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(map f c1 c2 c3)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276241721" ID="ID_1358011470" MODIFIED="1271276241721">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(map f c1 c2 c3 &amp; colls)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276246176" ID="ID_155201258" MODIFIED="1271276246176">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns a lazy sequence consisting of the result of applying f to the
set of first items of each coll, followed by applying f to the set
of second items in each coll, until any one of the colls is
exhausted.  Any remaining items in other colls are ignored. Function
f should accept number-of-colls arguments.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271276289697" ID="ID_1177264928" MODIFIED="1271276289697">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(pmap f coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276294660" ID="ID_322174818" MODIFIED="1271276294660">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(pmap f coll &amp; colls)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276298547" ID="ID_383618620" MODIFIED="1271276298547">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Like map, except f is applied in parallel. Semi-lazy in that the
parallel computation stays ahead of the consumption, but doesn't
realize the entire result unless required. Only useful for
computationally intensive functions where the time of f dominates
the coordination overhead.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271276345948" ID="ID_1297451456" MODIFIED="1271276345948">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(mapcat f &amp; colls)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276349937" ID="ID_1627674019" MODIFIED="1271276349937">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Returns the result of applying concat to the result of applying map
to f and colls.  Thus function f should return a collection.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271276473649" ID="ID_425939826" MODIFIED="1271276473649">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(replace smap coll)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276481982" ID="ID_778243619" MODIFIED="1271276481982">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Given a map of replacement pairs and a vector/collection, returns a
vector/seq with any elements = a key in smap replaced with the
corresponding val in smap</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271276515832" ID="ID_376106455" MODIFIED="1271276515832">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(seque s)</pre>
  </body>
</html></richcontent>
<node CREATED="1271276520257" ID="ID_1083862694" MODIFIED="1271276520257">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(seque n-or-q s)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271276526000" ID="ID_1351470585" MODIFIED="1271276526000">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Creates a queued seq on another (presumably lazy) seq s. The queued
seq will produce a concrete seq in the background, and can get up to
n items ahead of the consumer. n-or-q can be an integer n buffer
size, or an instance of java.util.concurrent BlockingQueue. Note
that reading from a seque can block if the reader gets ahead of the
producer.</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1271274765991" ID="ID_1893540943" MODIFIED="1271274885753" TEXT="Using a seq">
<node CREATED="1271274830120" ID="ID_30048774" MODIFIED="1271274830120">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Extract a specific-numbered item from a seq
  </body>
</html></richcontent>
</node>
<node CREATED="1271274838807" ID="ID_535226426" MODIFIED="1271274838807">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Construct a collection from a seq
  </body>
</html></richcontent>
</node>
<node CREATED="1271274844712" ID="ID_337681380" MODIFIED="1271274844712">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Pass items of a seq as arguments to a function
  </body>
</html></richcontent>
</node>
<node CREATED="1271274850990" ID="ID_39616339" MODIFIED="1271274850990">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Compute a boolean from a seq
  </body>
</html></richcontent>
</node>
<node CREATED="1271274856629" ID="ID_28849496" MODIFIED="1271274856629">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Search a seq using a predicate
  </body>
</html></richcontent>
</node>
<node CREATED="1271274862367" ID="ID_181908899" MODIFIED="1271274862367">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Force evaluation of lazy seqs
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271274771217" ID="ID_1531764553" MODIFIED="1271433061661" TEXT="Creating a seq">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1271274873231" ID="ID_520630299" MODIFIED="1271274873231">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Lazy seq from collection
  </body>
</html></richcontent>
</node>
<node CREATED="1271274898169" ID="ID_414455415" MODIFIED="1271274898169">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Lazy seq from producer function
  </body>
</html></richcontent>
</node>
<node CREATED="1271274905514" ID="ID_944706810" MODIFIED="1271274905514">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Lazy seq from constant
  </body>
</html></richcontent>
</node>
<node CREATED="1271274917225" ID="ID_1203796169" MODIFIED="1271274917225">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Lazy seq from other objects
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1271266191050" ID="ID_1709902140" MODIFIED="1271266202247" POSITION="right" TEXT="Multimethods"/>
<node CREATED="1271266202818" ID="ID_821434036" MODIFIED="1271266207111" POSITION="right" TEXT="Metadata"/>
<node CREATED="1271266209346" ID="ID_270091792" MODIFIED="1271266212280" POSITION="right" TEXT="Namespaces"/>
<node CREATED="1271266212587" ID="ID_1506299008" MODIFIED="1271266215449" POSITION="right" TEXT="Libs"/>
<node CREATED="1271266215787" FOLDED="true" ID="ID_740128662" MODIFIED="1271483300260" POSITION="right" TEXT="Vars and Environment">
<node CREATED="1271452367702" ID="ID_1963739647" MODIFIED="1271452367702">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    The special form <em><strong>def</strong></em> creates (and <a class="wiki_link" href="http://clojure.org/vars#Interning">interns</a>) a Var
  </body>
</html></richcontent>
</node>
<node CREATED="1271452920482" ID="ID_607500047" MODIFIED="1271452920482">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(binding bindings &amp; body)</pre>
  </body>
</html></richcontent>
<node CREATED="1271452934573" ID="ID_1202340979" MODIFIED="1271452934573">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">binding =&gt; var-symbol init-expr</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271452952166" ID="ID_564748284" MODIFIED="1271452952166">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Creates new bindings for the (already-existing) vars, with the
supplied initial values, executes the exprs in an implicit do, then
re-establishes the bindings that existed before.  The new bindings
are made in parallel (unlike let); all init-exprs are evaluated
before the vars are bound to their new values.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271453089296" ID="ID_1146941026" MODIFIED="1271453092242" TEXT="(set! var-symbol expr)">
<node CREATED="1271453207467" ID="ID_1924825755" MODIFIED="1271453356574" TEXT="When the first operand is a symbol, it must resolve to a global var. The value of the var&apos;s current thread binding is set to the value of expr. "/>
<node CREATED="1271453356577" ID="ID_1646582231" MODIFIED="1271453356578" TEXT="Currently, it is an error to attempt to set the root binding of a var using set!, i.e. var assignments are thread-local."/>
<node CREATED="1271453327067" ID="ID_1496935142" MODIFIED="1271453327068" TEXT="In all cases the value of expr is returned."/>
<node CREATED="1271453214569" ID="ID_1346873192" MODIFIED="1271453214569">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Note - <em>you cannot assign to function params or local bindings. Only Java fields, Vars, Refs and Agents are mutable in Clojure</em>.
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271266227459" ID="ID_63742189" MODIFIED="1271266237409" POSITION="right" TEXT="Refs and Transactions"/>
<node CREATED="1271266237740" ID="ID_4260068" MODIFIED="1271266240787" POSITION="right" TEXT="Agents"/>
<node CREATED="1271266241100" FOLDED="true" ID="ID_1006750455" MODIFIED="1271452091896" POSITION="right" TEXT="Atoms">
<node CREATED="1271451573869" ID="ID_16330329" MODIFIED="1271451573869">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(atom x)</pre>
  </body>
</html></richcontent>
<node CREATED="1271451580757" ID="ID_1198570364" MODIFIED="1271451580757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(atom x &amp; options)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271451624490" ID="ID_705864326" MODIFIED="1271451624490">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Creates and returns an Atom with an initial value of x and zero or
more options (in any order):

:meta metadata-map

:validator validate-fn

If metadata-map is supplied, it will be come the metadata on the
atom. validate-fn must be nil or a side-effect-free fn of one
argument, which will be passed the intended new state on any state
change. If the new state is unacceptable, the validate-fn should
return false or throw an exception.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271451651466" ID="ID_1609210764" MODIFIED="1271451651466">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(deref ref)</pre>
  </body>
</html></richcontent>
<node CREATED="1271451697619" ID="ID_1505424213" MODIFIED="1271451783286">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Also reader macro: @atom.
When applied to an atom, returns its current state.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271451843945" ID="ID_1818289667" MODIFIED="1271451847956" TEXT="swap!">
<node CREATED="1271451873308" ID="ID_1284684483" MODIFIED="1271451873308">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">Usage: (swap! atom f)
       (swap! atom f x)
       (swap! atom f x y)
       (swap! atom f x y &amp; args)</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1271451885552" ID="ID_369696503" MODIFIED="1271451885552">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Atomically swaps the value of atom to be:
(apply f current-value-of-atom args). Note that f may be called
multiple times, and thus should be free of side effects.  Returns
the value that was swapped in.</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271451969340" ID="ID_694174491" MODIFIED="1271451969340">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-usage">(compare-and-set! atom oldval newval)</pre>
  </body>
</html></richcontent>
<node CREATED="1271451974706" ID="ID_1994115687" MODIFIED="1271451974706">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre id="var-docstr">Atomically sets the value of atom to newval if and only if the
current value of the atom is identical to oldval. Returns true if
set happened, else false</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271266243754" FOLDED="true" ID="ID_1088239568" MODIFIED="1271372496821" POSITION="right" TEXT="Java Interop">
<node CREATED="1271296768515" FOLDED="true" ID="ID_701068547" MODIFIED="1271372494276" TEXT="Member access">
<node CREATED="1271297295041" ID="ID_1037538141" MODIFIED="1271297390695" TEXT="(.instanceMember instance args*)"/>
<node CREATED="1271297303314" ID="ID_233816199" MODIFIED="1271297390694" TEXT="(.instanceMember Classname args*)"/>
<node CREATED="1271297309687" ID="ID_1094884171" MODIFIED="1271297390694" TEXT="(Classname/staticMethod args*)"/>
<node CREATED="1271297318785" ID="ID_381217922" MODIFIED="1271297390693" TEXT="Classname/staticField"/>
</node>
<node CREATED="1271296907704" FOLDED="true" ID="ID_764132587" MODIFIED="1271372493613" TEXT="The Dot special form">
<node CREATED="1271297455383" ID="ID_107934873" MODIFIED="1271297465029" TEXT="(. instance-expr member-symbol)"/>
<node CREATED="1271297462164" ID="ID_210058013" MODIFIED="1271297465026" TEXT="(. Classname-symbol member-symbol)"/>
<node CREATED="1271297462159" ID="ID_1088962827" MODIFIED="1271297515789" TEXT="(. instance-expr (method-symbol args*))">
<node CREATED="1271297462154" ID="ID_539474730" MODIFIED="1271297465028" TEXT="(. instance-expr method-symbol args*)"/>
</node>
<node CREATED="1271297462149" ID="ID_738982229" MODIFIED="1271297521503" TEXT="(. Classname-symbol (method-symbol args*))">
<node CREATED="1271297462144" ID="ID_961869163" MODIFIED="1271297465029" TEXT="(. Classname-symbol method-symbol args*)"/>
</node>
</node>
<node CREATED="1271298667805" FOLDED="true" ID="ID_56317708" MODIFIED="1271372492644" TEXT="Other functions">
<node CREATED="1271370611523" ID="ID_1810719588" MODIFIED="1271370617423" TEXT="Dot-dot">
<node CREATED="1271370586084" ID="ID_1976492439" MODIFIED="1271370627228" TEXT="(.. instance-expr member+)"/>
<node CREATED="1271370602607" ID="ID_1218878616" MODIFIED="1271370627229" TEXT="(.. Classname-symbol member+)"/>
<node CREATED="1271370673783" ID="ID_1871731334" MODIFIED="1271370673783">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    member =&gt; fieldName-symbol or (instanceMethodName-symbol args*)
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271370690660" ID="ID_1520269065" MODIFIED="1271370694736" TEXT="(doto instance-expr (instanceMethodName-symbol args*)*)">
<node CREATED="1271370800826" ID="ID_1414868412" MODIFIED="1271370800826">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Macro. Evaluates instance-expr then calls all of the methods/functions with the supplied arguments in succession on the resulting object, returning it.
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271370896261" ID="ID_801952403" MODIFIED="1271370947690" TEXT="new special form">
<node CREATED="1271370905369" ID="ID_246796094" MODIFIED="1271370952385" TEXT="(Classname. args*)"/>
<node CREATED="1271370911392" ID="ID_485935339" MODIFIED="1271370952385" TEXT="(new Classname args*)"/>
</node>
<node CREATED="1271370968114" ID="ID_1817386713" MODIFIED="1271371032837" TEXT="(instance? Class expr)"/>
<node CREATED="1271371015396" ID="ID_195791567" MODIFIED="1271371025201" TEXT="set! special form">
<node CREATED="1271371041719" ID="ID_110725866" MODIFIED="1271371088025" TEXT="(set! (. instance-expr instanceFieldName-symbol) expr)"/>
<node CREATED="1271371046453" ID="ID_1334911505" MODIFIED="1271371087032" TEXT="(set! (. Classname-symbol staticFieldName-symbol) expr)"/>
</node>
<node CREATED="1271371098086" ID="ID_1803702994" MODIFIED="1271371101178" TEXT="(memfn method-name arg-names*)"/>
<node CREATED="1271371208526" ID="ID_1808355376" MODIFIED="1271371211224" TEXT="(bean obj)"/>
</node>
<node CREATED="1271296883216" FOLDED="true" ID="ID_224514345" MODIFIED="1271372495437" TEXT="Implementing Interfaces and Extending Classes">
<node CREATED="1271371268620" ID="ID_235293688" MODIFIED="1271371276661" TEXT="( proxy [class-and-interfaces] [args] fs+)">
<node CREATED="1271371329686" ID="ID_1145676878" MODIFIED="1271371329686">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    class-and-interfaces - a vector of class names<br />args - a (possibly empty) vector of arguments to the superclass constructor.<br />f =&gt; (name [params*] body) or (name ([params*] body) ([params+] body) ...)
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1271296857771" FOLDED="true" ID="ID_1159507409" MODIFIED="1271372490467" TEXT="Arrays">
<node CREATED="1271371362683" ID="ID_107539948" MODIFIED="1271371620254" TEXT="(alength array)"/>
<node CREATED="1271371367855" ID="ID_702942388" MODIFIED="1271371620253" TEXT="(aget array idx+)"/>
<node CREATED="1271371374335" ID="ID_1410590025" MODIFIED="1271371620253" TEXT="(aset array idx+ val)"/>
<node CREATED="1271371540500" ID="ID_1622394681" MODIFIED="1271371620252" TEXT="(make-array class dim+)"/>
<node CREATED="1271371551509" ID="ID_1634293341" MODIFIED="1271371620251" TEXT="(to-array coll)"/>
<node CREATED="1271371557987" ID="ID_1402958548" MODIFIED="1271371620251" TEXT="(into-array coll)"/>
<node CREATED="1271371597032" ID="ID_590169705" MODIFIED="1271371620250" TEXT="(to-array-2d coll)"/>
</node>
<node CREATED="1271296845836" FOLDED="true" ID="ID_799590051" MODIFIED="1271371824042" TEXT="Type Hints">
<node CREATED="1271371806235" ID="ID_657344155" MODIFIED="1271371806235">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Clojure supports the use of type hints to assist the compiler in avoiding reflection in performance-critical areas of code. Normally, one should avoid the use of type hints until there is a known performance bottleneck. Type hints are metadata tags placed on symbols or expressions that are consumed by the compiler. They can be placed on function parameters, let-bound names, var names (when defined), and expressions:<br />

    <pre type="text/css" class="text" style="font-family: monospace"><span class="parens">(</span><span class="macro">defn</span> len <span class="brackets">[</span>x<span class="brackets">]</span>
  <span class="parens">(</span>. x <span class="parens">(</span>length<span class="parens">)))</span>
<span class="parens">(</span><span class="macro">defn</span> len2 <span class="brackets">[</span>#^String x<span class="brackets">]</span>
  <span class="parens">(</span>. x <span class="parens">(</span>length<span class="parens">)))</span>
user=<span class="preencoded">&gt;</span> <span class="parens">(</span><span class="macro">time</span> <span class="parens">(</span><span class="function">reduce</span> + <span class="parens">(</span><span class="function">map</span> len <span class="parens">(</span><span class="function">replicate</span> 1000000 <span class="string">&quot;asdf&quot;</span><span class="parens">))))</span>
<span class="string">&quot;Elapsed time: 8315.198 msecs&quot;</span>
4000000
user=<span class="preencoded">&gt;</span> <span class="parens">(</span><span class="macro">time</span> <span class="parens">(</span><span class="function">reduce</span> + <span class="parens">(</span><span class="function">map</span> len2 <span class="parens">(</span><span class="function">replicate</span> 1000000 <span class="string">&quot;asdf&quot;</span><span class="parens">))))</span>
<span class="string">&quot;Elapsed time: 1158.045 msecs&quot;</span>
4000000</pre>
    Once a type hint has been placed on an identifier or expression, the compiler will try to resolve any calls to methods thereupon at compile time. In addition, the compiler will track the use of any return values and infer types for their use and so on, so very few hints are needed to get a fully compile-time resolved series of calls. Note that type hints are not needed for static members (or their return values!) as the compiler always has the type for statics.<br /><br />There is a *warn-on-reflection* flag (defaults to false) which will cause the compiler to warn you when it can't resolve to a direct call:<br />

    <pre type="text/css" class="text" style="font-family: monospace"><span class="parens">(</span><span class="function">set</span>! *warn<span class="function">-</span>on<span class="function">-</span>reflection* true<span class="parens">)</span>
-<span class="preencoded">&gt;</span> true
<span class="parens">(</span><span class="macro">defn</span> foo <span class="brackets">[</span>s<span class="brackets">]</span> <span class="parens">(</span>. s <span class="parens">(</span>charAt 1<span class="parens">)))</span>
-<span class="preencoded">&gt;</span> Reflection warning, line: 2 - call to charAt can't be resolved.
-<span class="preencoded">&gt;</span> #user<span class="function">/</span>foo
<span class="parens">(</span><span class="macro">defn</span> foo <span class="brackets">[</span>#^String s<span class="brackets">]</span> <span class="parens">(</span>. s <span class="parens">(</span>charAt 1<span class="parens">)))</span>
-<span class="preencoded">&gt;</span> #user<span class="function">/</span>foo</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271296831957" FOLDED="true" ID="ID_1941343323" MODIFIED="1271372488180" TEXT="Support for Java Primitives">
<node CREATED="1271372294327" ID="ID_234903332" MODIFIED="1271372294327">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <br />
    Clojure has support for high-performance manipulation of, and arithmetic involving, Java primitive types in local contexts. All Java primitive types are supported: int, float, long, double, boolean, char, short, and byte.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372282542" ID="ID_1718744420" MODIFIED="1271372282542">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul>
      <li>
        <em><strong>let</strong>/<strong>loop</strong></em>-bound locals can be of primitive types, having the inferred, possibly primitive type of their init-form.
      </li>
      <li>
        <em><strong>recur</strong></em> forms that rebind primitive locals do so without boxing, and do type-checking for same primitive type.
      </li>
      <li>
        Arithmetic (+,-,*,/,inc,dec,&lt;,&lt;=,&gt;,&gt;= etc) is overloaded for primitive types where semantics are same.
      </li>
      <li>
        <em><strong>aget</strong>/<strong>aset</strong></em> are overloaded for arrays of primitives
      </li>
      <li>
        <em><strong>aclone</strong></em>, <em><strong>alength</strong></em> functions for arrays of primitives
      </li>
      <li>
        constructor functions for primitive arrays: <em><strong>float-array</strong></em>, <em><strong>int-array</strong></em>, etc.
      </li>
      <li>
        Type hints for primitive arrays - <tt>#^ints, #^floats</tt>, etc.
      </li>
      <li>
        Coercion ops <em><strong>int, float,</strong> etc.</em> produce primitives when consumer can take primitive
      </li>
      <li>
        The <em><strong>num</strong></em> coercion function boxes primitives to force generic arithmetic
      </li>
      <li>
        Array cast functions <em><strong>ints, longs,</strong> etc.</em> which produce <tt>int[]</tt>, <tt>long[]</tt>, etc.
      </li>
      <li>
        A set of &quot;unchecked&quot; operations for utmost performing, but potentially unsafe, integer (int/long) ops: <em><strong>unchecked-add/subtract/multiply/divide/inc/dec</strong></em>
      </li>
      <li>
        <em><strong>amap</strong></em> and <em><strong>areduce</strong></em> macros for functionally (i.e. non-destructively) processing one or more arrays in order to produce a new array or aggregate value respectively.
      </li>
    </ul>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271296818351" FOLDED="true" ID="ID_152517114" MODIFIED="1271372491756" TEXT="Coercions">
<node CREATED="1271371866662" ID="ID_211875189" MODIFIED="1271371879152" TEXT="(int x)"/>
<node CREATED="1271371876928" ID="ID_161990648" MODIFIED="1271371879146" TEXT="(long x)"/>
<node CREATED="1271371876923" ID="ID_773703449" MODIFIED="1271371879148" TEXT="(float x)"/>
<node CREATED="1271371876915" ID="ID_795652821" MODIFIED="1271371879149" TEXT="(double x)"/>
<node CREATED="1271371876910" ID="ID_1796361457" MODIFIED="1271371879150" TEXT="(char x)"/>
<node CREATED="1271371876902" ID="ID_341170551" MODIFIED="1271371879150" TEXT="(boolean x)"/>
<node CREATED="1271371876895" ID="ID_1371576813" MODIFIED="1271371879151" TEXT="(short x)"/>
<node CREATED="1271371876889" ID="ID_1120843630" MODIFIED="1271371879152" TEXT="(byte x)"/>
</node>
<node CREATED="1271371982977" FOLDED="true" ID="ID_24553204" MODIFIED="1271372128517" TEXT="Some optimization tips">
<node CREATED="1271372002003" ID="ID_354514146" MODIFIED="1271372002003">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    All arguments are passed to Clojure fns as objects, so there's no point to putting non-array primitive type hints on fn args. Instead, use the let technique shown to place args in primitive locals if they need to participate in primitive arithmetic in the body.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372009660" ID="ID_653410187" MODIFIED="1271372009660">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    (let [foo (int bar)] ...) is the correct way to get a primitive local. Do not use #^Integer etc.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372058188" ID="ID_782947581" MODIFIED="1271372058188">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Don't rush to unchecked math unless you want truncating operations. HotSpot does a good job at optimizing the overflow check, which will yield an exception instead of silent truncation. On a typical example, that has about a 5% difference in speed - well worth it. Also, people reading your code don't know if you are using unchecked for truncation or performance - best to reserve it for the former and comment if the latter.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372077592" ID="ID_1312327530" MODIFIED="1271372077592">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    There's usually no point in trying to optimize an outer loop, in fact it can hurt you as you'll be representing things as primitives which just have to be re-boxed in order to become args to the inner call. The only exception is reflection warnings - you must get rid of them in any code that gets called frequently.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372098074" ID="ID_599743221" MODIFIED="1271372098074">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Almost every time someone presents something they are trying to optimize with hints, the faster version has far fewer hints than the original. If a hint doesn't improve things in the end - take it out.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372106354" ID="ID_480917420" MODIFIED="1271372106354">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Many people seem to presume only the unchecked- ops do primitive arithmetic - not so. When the args are primitive locals, regular + and * etc do primitive math with an overflow check - fast <em>and</em> safe.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372114877" ID="ID_1428337312" MODIFIED="1271372114877">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    So, the simplest route to fast math is to leave the operators alone and just make sure the source literals and locals are primitive. Arithmetic on primitives yields primitives. If you've got a loop (which you probably do if you need to optimize) make sure the loop locals are primitives first - then if you accidentally are producing a boxed intermediate result you'll get an error on recur. Don't solve that error by coercing your intermediate result, instead, figure out what argument or local is not primitive.
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1271296809479" FOLDED="true" ID="ID_1819895709" MODIFIED="1271372210530" TEXT="Simple XML Support">
<node CREATED="1271372175146" ID="ID_1229473493" MODIFIED="1271372175146">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Included with the distribution is simple XML support, found in the src/xml.clj file. All names from this file are in the xml namespace.
  </body>
</html></richcontent>
</node>
<node CREATED="1271372180873" ID="ID_380321928" MODIFIED="1271372196566" TEXT="(parse source)">
<node CREATED="1271372189274" ID="ID_242201666" MODIFIED="1271372189274">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Parses and loads the source, which can be a File, InputStream or String naming a URI. Returns a tree of the xml/element struct-map, which has the keys :tag, :attrs, and :content. and accessor fns tag, attrs, and content.<br />

    <pre type="text/css" class="text" style="font-family: monospace"><span class="parens">(</span>xml<span class="function">/parse</span> <span class="string">&quot;/Users/rich/dev/clojure/build.xml&quot;</span><span class="parens">)</span>
-<span class="preencoded">&gt;</span> <span class="curlybrackets">{</span><span class="keyword">:tag</span> <span class="keyword">:project</span>, <span class="keyword">:attrs</span> <span class="curlybrackets">{</span><span class="keyword">:name</span> <span class="string">&quot;clojure&quot;</span>, <span class="keyword">:default</span> <span class="string">&quot;jar&quot;</span><span class="curlybrackets">}</span>, <span class="keyword">:content</span> <span class="brackets">[</span><span class="curlybrackets">{</span><span class="keyword">:tag</span> <span class="keyword">:description</span>, ...</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1271266251501" ID="ID_1867689569" MODIFIED="1271266264076" POSITION="right" TEXT="Compilation &amp; Class Gen"/>
<node CREATED="1271266264750" ID="ID_639191515" MODIFIED="1271266292981" POSITION="right" TEXT="Other Libraries"/>
<node CREATED="1271267243642" ID="ID_987035466" MODIFIED="1271441868183" POSITION="left" TEXT="API">
<edge STYLE="bezier"/>
<node CREATED="1271267245702" ID="ID_809042748" MODIFIED="1271267271218" TEXT="clojure.core"/>
<node CREATED="1271267272123" ID="ID_1484935964" MODIFIED="1271267280350" TEXT="clojure.inspector"/>
<node CREATED="1271267280764" ID="ID_36227252" MODIFIED="1271267285115" TEXT="clojure.main"/>
<node CREATED="1271267285629" ID="ID_242902041" MODIFIED="1271267289299" TEXT="clojure.set"/>
<node CREATED="1271267289684" ID="ID_1909335641" MODIFIED="1271267295667" TEXT="clojure.stacktrace"/>
<node CREATED="1271267296125" ID="ID_517756635" MODIFIED="1271267301299" TEXT="clojure.template"/>
<node CREATED="1271267301741" ID="ID_1296025675" MODIFIED="1271267305924" TEXT="clojure.test"/>
<node CREATED="1271267306333" ID="ID_1809270242" MODIFIED="1271267310180" TEXT="clojure.walk"/>
<node CREATED="1271267310673" ID="ID_462285790" MODIFIED="1271267314604" TEXT="clojure.xml"/>
<node CREATED="1271267315062" ID="ID_1997220427" MODIFIED="1271267324187" TEXT="clojure.zip"/>
</node>
<node CREATED="1271450994600" ID="ID_1632523991" MODIFIED="1271451002191" POSITION="right" TEXT="Protocols"/>
</node>
</map>
