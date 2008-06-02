##ActiveSupport

*2.1.0 (May 31st, 2008)*
 
\* TimeZone#to\_s shows offset as GMT instead of UTC, because GMT will be more familiar to end users (see time zone selects used by Windows OS, google.com and yahoo.com.) Reverts [8370] [Geoff Buesing]
 
\* Hash.from\_xml: datetime xml types overflow to Ruby DateTime class when out of range of Time. Adding tests for utc offsets [Geoff Buesing]
 
\* TimeWithZone #+ and #- : ensure overflow to DateTime with Numeric arg [Geoff Buesing]
 
\* Time#to\_json: don't convert to utc before encoding. References #175 [Geoff Buesing]
 
\* Remove unused JSON::RESERVED\_WORDS, JSON.valid\_identifier? and JSON.reserved\_word? methods. Resolves #164. [Cheah Chu Yeow]
 
\* Adding Date.current, which returns Time.zone.today if config.time\_zone is set; otherwise returns Date.today [Geoff Buesing]
 
\* TimeWithZone: date part getter methods (#year #mon #day etc) are defined on class; no longer relying on method\_missing [Geoff Buesing]
 
\* Time.zone.parse return nil for strings with no date information [Geoff Buesing]
 
\* Time.zone.parse respects offset information in string. Resolves #105. [Scott Fleckenstein, Geoff Buesing]
 
\* Added Ruby 1.8 implementation of Process.daemon
 
\* Duration #since and #ago with no argument (e.g., 5.days.ago) return TimeWithZone when config.time\_zone is set. Introducing Time.current, which returns Time.zone.now if config.time\_zone is set, otherwise just returns Time.now [Geoff Buesing]
 
\* Time#since behaves correctly when passed a Duration. Closes #11527 [kemiller]
 
\* Add #getutc alias for DateTime#utc [Geoff Buesing]
 
\* Refactor TimeWithZone: don't send #since, #ago, #+, #-, #advance through method\_missing [Geoff Buesing]
 
\* TimeWithZone respects config.active\_support.use\_standard\_json\_time\_format [Geoff Buesing]
 
\* Add config.active\_support.escape\_html\_entities\_in\_json to allow disabling of html entity escaping.  [rick]
 
\* Improve documentation. [Xavier Noria]
 
\* Modified ActiveSupport::Callbacks::Callback#call to accept multiple arguments.
 
\* Time #yesterday and #tomorrow behave correctly crossing DST boundary. Closes #7399 [sblackstone]
 
\* TimeWithZone: Adding tests for dst and leap day edge cases when advancing time [Geoff Buesing]
 
\* TimeWithZone#method\_missing: send to utc to advance with dst correctness, otherwise send to time. Adding tests for time calculations methods [Geoff Buesing]
 
\* Add config.active\_support.use\_standard\_json\_time\_format setting so that Times and Dates export to ISO 8601 dates.  [rick]
 
\* TZInfo: Removing unneeded TimezoneProxy class [Geoff Buesing]
 
\* TZInfo: Removing unneeded TimezoneIndexDefinition, since we're not including Indexes::Timezones [Geoff Buesing] 
 
\* Removing unnecessary uses\_tzinfo helper from tests, given that TZInfo is now bundled [Geoff Buesing]
 
\* Bundling abbreviated version of TZInfo gem 0.3.8: only the classes and zone definitions required to support Rails time zone features are included. If a recent version of the full TZInfo gem is installed, this will take precedence over the bundled version [Geoff Buesing]
 
\* TimeWithZone#marshal\_load does zone lookup via Time.get\_zone, so that tzinfo/Olson identifiers are handled [Geoff Buesing]
 
\* Time.zone= accepts TZInfo::Timezone instances and Olson identifiers; wraps result in TimeZone instance [Geoff Buesing] 
 
\* TimeWithZone time conversions don't need to be wrapped in TimeOrDateTime, because TZInfo does this internally [Geoff Buesing]
 
\* TimeWithZone#usec returns 0 instead of error when DateTime is wrapped [Geoff Buesing]
 
\* Improve documentation. [Radar, Jan De Poorter, chuyeow, xaviershay, danger, miloops, Xavier Noria,  Sunny Ripert]
 
\* Ensure that TimeWithZone#to\_yaml works when passed a YAML::Emitter.  [rick]
 
\* Ensure correct TimeWithZone#to\_date [Geoff Buesing]
 
\* Make TimeWithZone work with tzinfo 0.2.x: use TZInfo::Timezone#zone\_identifier alias for #abbreviation, silence warnings on tests. Raise LoadError when TZInfo version is < 0.2 by sniffing for TZInfo::TimeOrDateTime constant. Move all tzinfo-dependent TimeZone tests into uses\_tzinfo block [Geoff Buesing]
 
\* Time, DateTime and TimeWithZone #in\_time\_zone defaults to Time.zone. Removing now unneeded #in\_current\_time\_zone [Geoff Buesing]
 
\* TZInfo caches Timezone instances in its own internal hash cache, so TimeZone::MAPPING doesn't need to cache them as well [Geoff Buesing]
 
\* Adding TimeZone#parse [Geoff Buesing]
 
\* Adding TimeZone#at and DateTime#to\_f [Geoff Buesing]
 
\* TimeWithZone responds to Ruby 1.9 weekday-named query methods [Geoff Buesing]
 
\* TimeWithZone caches TZInfo::TimezonePeriod used for time conversion so that it can be reused, and enforces DST rules correctly when instance is created from a local time [Geoff Buesing]
 
\* Fixed that BufferedLogger should create its own directory if one doesn't already exist #11285 [lotswholetime]
 
\* Fix Numeric time tests broken by DST change by anchoring them to fixed times instead of Time.now. Anchor TimeZone#now DST test to time specified with Time.at instead of Time.local to work around platform differences with Time.local and DST representation [Geoff Buesing]
 
\* Removing unneeded #change\_time\_zone method from Time, DateTime and TimeWithZone [Geoff Buesing]
 
\* TimeZone #local and #now correctly enforce DST rules [Geoff Buesing]
 
\* TimeWithZone instances correctly enforce DST rules. Adding TimeZone#period\_for\_utc [Geoff Buesing]
 
\* test\_time\_with\_datetime\_fallback expects DateTime.local\_offset instead of DateTime.now.offset [Geoff Buesing]
 
\* Adding TimeWithZone #marshal\_dump and #marshal\_load [Geoff Buesing]
 
\* Add OrderedHash#to\_hash [josh]
 
\* Adding Time#end\_of\_day, \_quarter, \_week, and \_year.  #9312 [Juanjo Bazan, Tarmo Tänav, BigTitus]
 
\* Adding TimeWithZone#between? [Geoff Buesing]
 
\* Time.=== returns true for TimeWithZone instances [Geoff Buesing]
 
\* TimeWithZone #+ and #- behave consistently with numeric arguments regardless of whether wrapped time is a Time or DateTime; consistenty answers false to #acts\_like?(:date) [Geoff Buesing]
 
\* Add String#squish and String#squish! to remove consecutive chunks of whitespace.  #11123 [jordi, Henrik N]
 
\* Serialize BigDecimals as Floats when using to\_yaml. #8746 [ernesto.jimenez]
 
\* Adding TimeWithZone #to\_yaml, #to\_datetime, #eql? and method aliases for duck-typing compatibility with Time [Geoff Buesing]
 
\* TimeWithZone #in\_time\_zone returns +self+ if zone argument is the same as #time\_zone [Geoff Buesing]
 
\* Adding TimeWithZone #to\_a, #to\_f, #to\_i, #httpdate, #rfc2822 [Geoff Buesing]
 
\* Pruning unneeded TimeWithZone#change\_time\_zone\_to\_current [Geoff Buesing]
 
\* Time#zone=, #in\_time\_zone and #change\_time\_zone accept a Duration [Geoff Buesing]
 
\* Time#in\_time\_zone handles Time.local instances correctly [Geoff Buesing]
 
\* Pruning unneeded Time#change\_time\_zone\_to\_current. Enhanced docs to #change\_time\_zone to explain the difference between this method and #in\_time\_zone [Geoff Buesing]
 
\* TimeZone#new method renamed #local; when used with Time.zone, constructor now reads: Time.zone.local() [Geoff Buesing]
 
\* Added Base64.encode64s to encode values in base64 without the newlines. This makes the values immediately usable as URL parameters or memcache keys without further processing [DHH]
 
\* Remove :nodoc: entries around the ActiveSupport test/unit assertions.  #10946 [dancroak, jamesh]
 
\* Add Time.zone\_default accessor for setting the default time zone.  Rails::Configuration.time\_zone sets this.  #10982 [Geoff Buesing]
 
\* cache.fetch(key, :force => true) to force a cache miss.  [Jeremy Kemper]
 
\* Support retrieving TimeZones with a Duration.  TimeZone[-28800] == TimeZone[-480.minutes].  [rick]
 
\* TimeWithZone#- added, so that #- can handle a Time or TimeWithZone argument correctly [Geoff Buesing]
 
\* with\_timezone test helper renamed with\_env\_tz, to distinguish between setting ENV['TZ'] and setting Time.zone in tests [Geoff Buesing]
 
\* Time#- coerces TimeWithZone argument to a Time instance so that difference in seconds can be calculated. Closes #10914 [Geoff Buesing, yyyc514]
 
\* Adding UTC zone to TimeZone; TimeWithZone no longer has to fake UTC zone with nil [Geoff Buesing]
 
\* Time.get\_zone refactored to private method, given that the encapsulated logic is only useful internally [Geoff Buesing]
 
\* Time.zone uses thread-local variable for thread safety. Adding Time.use\_zone, for overriding Time.zone locally inside a block. Removing unneeded Time.zone\_reset! [Geoff Buesing]
 
\* TimeZone#to\_s uses UTC rather than GMT; reapplying change that was undone in [8679]. #1689 [Cheah Chu Yeow]
 
\* Time.days\_in\_month defaults to current year if no year is supplied as argument #10799 [Radar], uses Date.gregorian\_leap? to determine leap year, and uses constant lookup to determine days in month [Geoff Buesing]  
 
\* Adding Time and DateTime #compare\_with\_coercion, which layers behavior on #<=> so that any combination of Time, DateTime and ActiveSupport::TimeWithZone instances can be chronologically compared [Geoff Buesing]
 
\* TimeZone#now returns an ActiveSupport::TimeWithZone [Geoff Buesing]
 
\* Time #in\_current\_time\_zone and #change\_time\_zone\_to\_current return self when Time.zone is nil [Geoff Buesing]
 
\* Remove unneeded #to\_datetime\_default\_s alias for DateTime#to\_s, given that we inherit a #to\_default\_s from Date that does exactly the same thing [Geoff Buesing]
 
\* Refactor Time and DateTime #to\_formatted\_s: use ternary instead of nested if/else [Geoff Buesing]
 
\* Adding Time and DateTime #formatted\_offset, for outputting +HH:MM utc offset strings with cross-platform consistency [Geoff Buesing]
 
\* Adding alternate\_utc\_string option to TimeZone#formatted\_offset. Removing unneeded TimeZone#offset. [Geoff Buesing]
 
\* Introduce ActiveSupport::TimeWithZone, for wrapping Time instances with a TimeZone. Introduce instance methods to Time for creating TimeWithZone instances, and class methods for managing a global time zone. [Geoff Buesing]
 
>>>>>>> .r8815
\* Replace non-dst-aware TimeZone class with dst-aware class from tzinfo\_timezone plugin. TimeZone#adjust and #unadjust are no longer available; tzinfo gem must now be present in order to perform time zone calculations, via #local\_to\_utc and #utc\_to\_local methods. [Geoff Buesing]
 
\* Extract ActiveSupport::Callbacks from Active Record, test case setup and teardown, and ActionController::Dispatcher.  #10727 [Josh Peek]
 
\* Introducing DateTime #utc, #utc? and #utc\_offset, for duck-typing compatibility with Time. Closes #10002 [Geoff Buesing]
 
\* Time#to\_json uses Numeric#to\_utc\_offset\_s to output a cross-platform-consistent representation without having to convert to DateTime. References #9750 [Geoff Buesing]
 
\* Refactor number-to-HH:MM-string conversion logic from TimeZone#formatted\_offset to a reusable Numeric#to\_utc\_offset\_s method. [Geoff Buesing]
 
\* Continue evolution toward ActiveSupport::TestCase.  #10679 [Josh Peek]
 
\* TestCase: introduce declared setup and teardown callbacks. Pass a list of methods and an optional block to call before setup or after teardown. Setup callbacks are run in the order declared; teardown callbacks are run in reverse.  [Jeremy Kemper]
 
\* Added ActiveSupport::Gzip.decompress/compress(source) as an easy wrapper for Zlib [Tobias Luetke]
 
\* Included MemCache-Client to make the improved ActiveSupport::Cache::MemCacheStore work out of the box [Bob Cottrell, Eric Hodel]
 
\* Added ActiveSupport::Cache::\* framework as an extraction from ActionController::Caching::Fragments::\* [DHH]
 
\* Fixed String#titleize to work for strings with 's too #10571 [trek]
 
\* Changed the implementation of Enumerable#group\_by to use a double array approach instead of a hash such that the insert order is honored [DHH/Marcel]
 
\* remove multiple enumerations from ActiveSupport::JSON#convert\_json\_to\_yaml when dealing with date/time values.  [rick]
 
\* Hash#symbolize\_keys skips keys that can't be symbolized.  #10500 [Brad Greenlee]
 
\* Ruby 1.9 compatibility.  #1689, #10466, #10468, #10554, #10594, #10632 [Cheah Chu Yeow, Pratik Naik, Jeremy Kemper, Dirkjan Bussink, fxn]
 
\* TimeZone#to\_s uses UTC rather than GMT.  #1689 [Cheah Chu Yeow]
 
\* Refactor of Hash#symbolize\_keys! to use Hash#replace.  Closes #10420 [ReinH]
 
\* Fix HashWithIndifferentAccess#to\_options! so it doesn't clear the options hash.  Closes #10419 [ReinH]
