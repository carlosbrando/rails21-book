## ActiveResource

2.1.0 (May 31st, 2008)*
 
\* Fixed response logging to use length instead of the entire thing (seangeo) [#27]
 
\* Fixed that to\_param should be used and honored instead of hardcoding the id #11406 [gspiers]
 
\* Improve documentation. [Radar, Jan De Poorter, chuyeow, xaviershay, danger, miloops, Xavier Noria,  Sunny Ripert]
 
\* Use HEAD instead of GET in exists? [bscofield]
 
\* Fix small documentation typo.  Closes #10670 [l.guidi]
 
\* find\_or\_create\_resource\_for handles module nesting.  #10646 [xavier]
 
\* Allow setting ActiveResource::Base#format before #site.  [rick]
 
\* Support agnostic formats when calling custom methods.  Closes #10635 [joerichsen]
 
\* Document custom methods.  #10589 [Cheah Chu Yeow]
 
\* Ruby 1.9 compatibility.  [Jeremy Kemper]