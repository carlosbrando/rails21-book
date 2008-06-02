## ActionPack

*2.1.0 (May 31st, 2008)*
 
\* InstanceTag#default\_time\_from\_options overflows to DateTime [Geoff Buesing]
 
\* Fixed that forgery protection can be used without session tracking (Peter Jones) [#139]
 
\* Added session(:on) to turn session management back on in a controller subclass if the superclass turned it off (Peter Jones) [#136]
 
\* Change the request forgery protection to go by Content-Type instead of request.format so that you can't bypass it by POSTing to "#{request.uri}.xml" [rick]
\* InstanceTag#default\_time\_from\_options with hash args uses Time.current as default; respects hash settings when time falls in system local spring DST gap [Geoff Buesing]
 
\* select\_date defaults to Time.zone.today when config.time\_zone is set [Geoff Buesing]
 
\* Fixed that TextHelper#text\_field would corrypt when raw HTML was used as the value (mchenryc, Kevin Glowacz) [#80]
 
\* Added ActionController::TestCase#rescue\_action\_in\_public! to control whether the action under test should use the regular rescue\_action path instead of simply raising the exception inline (great for error testing) [DHH]
 
\* Reduce number of instance variables being copied from controller to view. [Pratik]
 
\* select\_datetime and select\_time default to Time.zone.now when config.time\_zone is set [Geoff Buesing]
 
\* datetime\_select defaults to Time.zone.now when config.time\_zone is set [Geoff Buesing]
 
\* Remove ActionController::Base#view\_controller\_internals flag. [Pratik]
 
\* Add conditional options to caches\_page method. [Paul Horsfall]
 
\* Move missing template logic to ActionView. [Pratik]
 
\* Introduce ActionView::InlineTemplate class. [Pratik]
 
\* Automatically parse posted JSON content for Mime::JSON requests.  [rick]
 
  POST /posts
  {"post": {"title": "Breaking News"}}
 
  def create
    @post = Post.create params[:post]
    # ...
  end
 
\* add json\_escape ERB util to escape html entities in json strings that are output in HTML pages. [rick]
 
\* Provide a helper proxy to access helper methods from outside views. Closes #10839 [Josh Peek]
  e.g. ApplicationController.helpers.simple\_format(text)
 
\* Improve documentation. [Xavier Noria, leethal, jerome]
 
\* Ensure RJS redirect\_to doesn't html-escapes string argument. Closes #8546 [josh, eventualbuddha, Pratik]
 
\* Support render :partial => collection of heterogeneous elements.  #11491 [Zach Dennis]
 
\* Avoid remote\_ip spoofing.  [Brian Candler]
 
\* Added support for regexp flags like ignoring case in the :requirements part of routes declarations #11421 [NeilW]
 
\* Fixed that ActionController::Base#read\_multipart would fail if boundary was exactly 10240 bytes #10886 [ariejan]
 
\* Fixed HTML::Tokenizer (used in sanitize helper) didn't handle unclosed CDATA tags #10071 [esad, packagethief]
 
\* Improve documentation. [Radar, Jan De Poorter, chuyeow, xaviershay, danger, miloops, Xavier Noria,  Sunny Ripert]
 
\* Fixed that FormHelper#radio\_button would produce invalid ids #11298 [harlancrystal]
 
\* Added :confirm option to submit\_tag #11415 [miloops]
 
\* Fixed NumberHelper#number\_with\_precision to properly round in a way that works equally on Mac, Windows, Linux (closes #11409, #8275, #10090, #8027) [zhangyuanyi]
 
\* Allow the #simple\_format text\_helper to take an html\_options hash for each paragraph.  #2448 [Francois Beausoleil, thechrisoshow]
 
\* Fix regression from filter refactoring where re-adding a skipped filter resulted in it being called twice.  [rick]
 
\* Refactor filters to use Active Support callbacks.  #11235 [Josh Peek]
 
\* Fixed that polymorphic routes would modify the input array #11363 [thomas.lee]
 
\* Added :format option to NumberHelper#number\_to\_currency to enable better localization support #11149 [lylo]
 
\* Fixed that TextHelper#excerpt would include one character too many #11268 [Irfy]
 
\* Fix more obscure nested parameter hash parsing bug.  #10797 [thomas.lee]
 
\* Added ActionView::Helpers::register\_javascript/stylesheet\_expansion to make it easier for plugin developers to inject multiple assets.  #10350 [lotswholetime]
 
\* Fix nested parameter hash parsing bug.  #10797 [thomas.lee]
 
\* Allow using named routes in ActionController::TestCase before any request has been made. Closes #11273 [alloy]
 
\* Fixed that sweepers defined by cache\_sweeper will be added regardless of the perform\_caching setting. Instead, control whether the sweeper should be run with the perform\_caching setting. This makes testing easier when you want to turn perform\_caching on/off [DHH]
 
\* Make MimeResponds::Responder#any work without explicit types. Closes #11140 [jaw6]
 
\* Better error message for type conflicts when parsing params.  Closes #7962 [spicycode, matt]
 
\* Remove unused ActionController::Base.template\_class. Closes #10787 [Pratik]
 
\* Moved template handlers related code from ActionView::Base to ActionView::Template. [Pratik]
 
\* Tests for div\_for and content\_tag\_for helpers. Closes #11223 [thechrisoshow]
 
\* Allow file uploads in Integration Tests.  Closes #11091 [RubyRedRick]
 
\* Refactor partial rendering into a PartialTemplate class. [Pratik]
 
\* Added that requests with JavaScript as the priority mime type in the accept header and no format extension in the parameters will be treated as though their format was :js when it comes to determining which template to render. This makes it possible for JS requests to automatically render action.js.rjs files without an explicit respond\_to block  [DHH]
 
\* Tests for distance\_of\_time\_in\_words with TimeWithZone instances. Closes #10914 [ernesto.jimenez]
 
\* Remove support for multivalued (e.g., '&'-delimited) cookies. [Jamis Buck]
 
\* Fix problem with render :partial collections, records, and locals. #11057 [lotswholetime] 
 
\* Added support for naming concrete classes in sweeper declarations [DHH]
 
\* Remove ERB trim variables from trace template in case ActionView::Base.erb\_trim\_mode is changed in the application.  #10098 [tpope, kampers]
 
\* Fix typo in form\_helper documentation.  #10650 [xaviershay, kampers]
 
\* Fix bug with setting Request#format= after the getter has cached the value.  #10889 [cch1]
 
\* Correct inconsistencies in RequestForgeryProtection docs.  #11032 [mislav]
 
\* Introduce a Template class to ActionView.  #11024 [lifofifo]
 
\* Introduce the :index option for form\_for and fields\_for to simplify multi-model forms (see http://railscasts.com/episodes/75).  #9883 [rmm5t]
 
\* Introduce map.resources :cards, :as => 'tarjetas' to use a custom resource name in the URL: cards\_path == '/tarjetas'.  #10578 [blj]
 
\* TestSession supports indifferent access.  #7372 [tamc, Arsen7, mhackett, julik, jean.helou]
 
\* Make assert\_routing aware of the HTTP method used.  #8039 [mpalmer]
  e.g. assert\_routing({ :method => 'put', :path => '/product/321' }, { :controller => "product", :action => "update", :id => "321" })
 
\* Make map.root accept a single symbol as an argument to declare an alias.  #10818 [bscofield] 
 
  e.g.  map.dashboard '/dashboard', :controller=>'dashboard'
        map.root      :dashboard
 
\* Handle corner case with image\_tag when passed 'messed up' image names. #9018 [duncanbeevers, mpalmer]
 
\* Add label\_tag helper for generating elements. #10802 [DefV]
 
\* Introduce TemplateFinder to handle view paths and lookups.  #10800 [Pratik Naik] 
 
\* Performance: optimize route recognition. Large speedup for apps with many resource routes.  #10835 [oleganza]
 
\* Make render :partial recognise form builders and use the \_form partial.  #10814 [djanowski]
 
\* Allow users to declare other namespaces when using the atom feed helpers. #10304 [david.calavera]
 
\* Introduce send\_file :x\_sendfile => true to send an X-Sendfile response header.  [Jeremy Kemper]
 
\* Fixed ActionView::Helpers::ActiveRecordHelper::form for when protect\_from\_forgery is used #10739 [jeremyevans]
 
\* Provide nicer access to HTTP Headers.  Instead of request.env["HTTP\_REFERRER"] you can now use request.headers["Referrer"]. [Koz]
 
\* UrlWriter respects relative\_url\_root.  #10748 [Cheah Chu Yeow]
 
\* The asset\_host block takes the controller request as an optional second argument. Example: use a single asset host for SSL requests.  #10549 [Cheah Chu Yeow, Peter B, Tom Taylor]
 
\* Support render :text => nil.  #6684 [tjennings, PotatoSalad, Cheah Chu Yeow]
 
\* assert\_response failures include the exception message.  #10688 [Seth Rasmussen]
 
\* All fragment cache keys are now by default prefixed with the "views/" namespace [DHH]
 
\* Moved the caching stores from ActionController::Caching::Fragments::\* to ActiveSupport::Cache::*. If you're explicitly referring to a store, like ActionController::Caching::Fragments::MemoryStore, you need to update that reference with ActiveSupport::Cache::MemoryStore [DHH]
 
\* Deprecated ActionController::Base.fragment\_cache\_store for ActionController::Base.cache\_store [DHH]
 
\* Made fragment caching in views work for rjs and builder as well #6642 [zsombor]
 
\* Fixed rendering of partials with layout when done from site layout #9209 [antramm]
 
\* Fix atom\_feed\_helper to comply with the atom spec.  Closes #10672 [xaviershay]
 
  \* The tags created do not contain a date (http://feedvalidator.org/docs/error/InvalidTAG.html)
  \* IDs are not guaranteed unique
  \* A default self link was not provided, contrary to the documentation
  \* NOTE:  This changes tags for existing atom entries, but at least they validate now.
 
\* Correct indentation in tests.  Closes #10671 [l.guidi]
 
\* Fix that auto\_link looks for ='s in url paths (Amazon urls have them).  Closes #10640 [bgreenlee]
 
\* Ensure that test case setup is run even if overridden.  #10382 [Josh Peek]
 
\* Fix HTML Sanitizer to allow trailing spaces in CSS style attributes.  Closes #10566 [wesley.moxam]
 
\* Add :default option to time\_zone\_select.  #10590 [Matt Aimonetti]
 
