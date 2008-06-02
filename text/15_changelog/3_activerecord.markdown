## ActiveRecord

*2.1.0 (May 31st, 2008)*
 
\* Add ActiveRecord::Base.sti\_name that checks ActiveRecord::Base#store\_full\_sti\_class? and returns either the full or demodulized name. [rick]
 
\* Add first/last methods to associations/named\_scope. Resolved #226. [Ryan Bates]
 
\* Added SQL escaping for :limit and :offset #288 [Aaron Bedra, Steven Bristol, Jonathan Wiess] 
 
\* Added first/last methods to associations/named\_scope. Resolved #226. [Ryan Bates]
 
\* Ensure hm:t preloading honours reflection options. Resolves #137. [Frederick Cheung]
 
\* Added protection against duplicate migration names (Aslak Hellesøy) [#112]
 
\* Base#instantiate\_time\_object: eliminate check for Time.zone, since we can assume this is set if time\_zone\_aware\_attributes is set to true [Geoff Buesing]
 
\* Time zone aware attribute methods use Time.zone.parse instead of #to\_time for String arguments, so that offset information in String is respected. Resolves #105. [Scott Fleckenstein, Geoff Buesing]
 
\* Added change\_table for migrations (Jeff Dean) [#71]. Example:
 
    change_table :videos do |t|
      t.timestamps                          # adds created_at, updated_at
      t.belongs_to :goat                    # adds goat_id integer
      t.string :name, :email, :limit => 20  # adds name and email both with a 20 char limit
      t.remove :name, :email                # removes the name and email columns
    end
 
\* Fixed has\_many :through .create with no parameters caused a "can't dup NilClass" error (Steven Soroka) [#85]
 
\* Added block-setting of attributes for Base.create like Base.new already has (Adam Meehan) [#39]
 
\* Fixed that pessimistic locking you reference the quoted table name (Josh Susser) [#67]
 
\* Fixed that change\_column should be able to use :null => true on a field that formerly had false [Nate Wiger] [#26]
 
\* Added that the MySQL adapter should map integer to either smallint, int, or bigint depending on the :limit just like PostgreSQL [DHH]
 
\* Change validates\_uniqueness\_of :case\_sensitive option default back to true (from [9160]).  Love your database columns, don't LOWER them.  [rick]
 
\* Add support for interleaving migrations by storing which migrations have run in the new schema\_migrations table. Closes #11493 [jordi]
 
\* ActiveRecord::Base#sum defaults to 0 if no rows are returned.  Closes #11550 [kamal]
 
\* Ensure that respond\_to? considers dynamic finder methods. Closes #11538. [floehopper]
 
\* Ensure that save on parent object fails for invalid has\_one association. Closes #10518. [Pratik]
 
\* Remove duplicate code from associations. [Pratik]
 
\* Refactor HasManyThroughAssociation to inherit from HasManyAssociation. Association callbacks and <association>\_ids= now work with hm:t. #11516 [rubyruy]
 
\* Ensure HABTM#create and HABTM#build do not load entire association. [Pratik]
 
\* Improve documentation. [Xavier Noria, Jack Danger Canty, leethal]
 
\* Tweak ActiveRecord::Base#to\_json to include a root value in the returned hash: {"post": {"title": ...}} [rick]
 
	Post.find(1).to_json # => {"title": ...}
	config.active_record.include_root_in_json = true
	Post.find(1).to_json # => {"post": {"title": ...}}
 
\* Add efficient #include? to AssociationCollection (for has\_many/has\_many :through/habtm).  [stopdropandrew]
 
\* PostgreSQL: create\_ and drop\_database support.  #9042 [ez, pedz, nicksieger]
 
\* Ensure that validates\_uniqueness\_of works with with\_scope. Closes #9235. [nik.wakelin, cavalle]
 
\* Partial updates include only unsaved attributes. Off by default; set YourClass.partial\_updates = true to enable.  [Jeremy Kemper]
 
\* Removing unnecessary uses\_tzinfo helper from tests, given that TZInfo is now bundled [Geoff Buesing]
 
\* Fixed that validates\_size\_of :within works in associations #11295, #10019 [cavalle]
 
\* Track changes to unsaved attributes.  [Jeremy Kemper]
 
\* Switched to UTC-timebased version numbers for migrations and the schema. This will as good as eliminate the problem of multiple migrations getting the same version assigned in different branches. Also added rake db:migrate:up/down to apply individual migrations that may need to be run when you merge branches #11458 [jbarnette]
 
\* Fixed that has\_many :through would ignore the hash conditions #11447 [miloops]
 
\* Fix issue where the :uniq option of a has\_many :through association is ignored when find(:all) is called.  Closes #9407 [cavalle]
 
\* Fix duplicate table alias error when including an association with a has\_many :through association on the same join table.  Closes #7310 [cavalle]
 
\* More efficient association preloading code that compacts a through\_records array in a central location.  Closes #11427 [danger]
 
\* Improve documentation. [Radar, Jan De Poorter, chuyeow, xaviershay, danger, miloops, Xavier Noria,  Sunny Ripert]
 
\* Fixed that ActiveRecord#Base.find\_or\_create/initialize would not honor attr\_protected/accessible when used with a hash #11422 [miloops]
 
\* Added ActiveRecord#Base.all/first/last as aliases for find(:all/:first/:last) #11413 [nkallen, thechrisoshow]
 
\* Merge the has\_finder gem, renamed as 'named\_scope'.  #11404 [nkallen]
 
	class Article < ActiveRecord::Base
		named_scope :published, :conditions => {:published => true}
		named_scope :popular, :conditions => ...
  	end
 
	Article.published.paginate(:page => 1)
	Article.published.popular.count
	Article.popular.find(:first)
	Article.popular.find(:all, :conditions => {...})
 
See http://pivots.pivotallabs.com/users/nick/blog/articles/284-hasfinder-it-s-now-easier-than-ever-to-create-complex-re-usable-sql-queries
 
\* Add has\_one :through support.  #4756 [thechrisoshow]
 
\* Migrations: create\_table supports primary\_key\_prefix\_type.  #10314 [student, thechrisoshow]
 
\* Added logging for dependency load errors with fixtures #11056 [stuthulhu]
 
\* Time zone aware attributes use Time#in\_time\_zone [Geoff Buesing]
 
\* Fixed that scoped joins would not always be respected #6821 [Theory/Danger]
 
\* Ensure that ActiveRecord::Calculations disambiguates field names with the table name.  #11027 [cavalle]
 
\* Added add/remove\_timestamps to the schema statements for adding the created\_at/updated\_at columns on existing tables #11129 [jramirez]
 
\* Added ActiveRecord::Base.find(:last) #11338 [miloops]
 
\* test\_native\_types expects DateTime.local\_offset instead of DateTime.now.offset; fixes test breakage due to dst transition [Geoff Buesing]
 
\* Add :readonly option to HasManyThrough associations. #11156 [miloops]
 
\* Improve performance on :include/:conditions/:limit queries by selectively joining in the pre-query.  #9560 [dasil003]
 
\* Perf fix: Avoid the use of named block arguments.  Closes #11109 [adymo]
 
\* PostgreSQL: support server versions 7.4 through 8.0 and the ruby-pg driver.  #11127 [jdavis]
 
\* Ensure association preloading doesn't break when an association returns nil. ##11145 [GMFlash]
 
\* Make dynamic finders respect the :include on HasManyThrough associations.  #10998. [cpytel]
 
\* Base#instantiate\_time\_object only uses Time.zone when Base.time\_zone\_aware\_attributes is true; leverages Time#time\_with\_datetime\_fallback for readability [Geoff Buesing]
 
\* Refactor ConnectionAdapters::Column.new\_time: leverage DateTime failover behavior of Time#time\_with\_datetime\_fallback [Geoff Buesing]
 
\* Improve associations performance by using symbol callbacks instead of string callbacks. #11108 [adymo]
 
\* Optimise the BigDecimal conversion code.  #11110 [adymo]
 
\* Introduce the :readonly option to all associations. Records from the association cannot be saved.  #11084 [miloops]
 
\* Multiparameter attributes for time columns fail over to DateTime when out of range of Time [Geoff Buesing]
 
\* Base#instantiate\_time\_object uses Time.zone.local() [Geoff Buesing]
 
\* Add timezone-aware attribute readers and writers. #10982 [Geoff Buesing]
 
\* Instantiating time objects in multiparameter attributes uses Time.zone if available.  #10982 [rick]
 
\* Add note about how ActiveRecord::Observer classes are initialized in a Rails app. #10980 [fxn]
 
\* MySQL: omit text/blob defaults from the schema instead of using an empty string.  #10963 [mdeiters]
 
\* belongs\_to supports :dependent => :destroy and :delete.  #10592 [Jonathan Viney]
 
\* Introduce preload query strategy for eager :includes.  #9640 [Frederick Cheung, Aleksey Kondratenko, codafoo]
 
\* Support aggregations in finder conditions.  #10572 [Ryan Kinderman]
 
\* Organize and clean up the Active Record test suite.  #10742 [John Barnette]
 
\* Ensure that modifying has\_and\_belongs\_to\_many actions clear the query cache.  Closes #10840 [john.andrews]
 
\* Fix issue where Table#references doesn't pass a :null option to a *\_type attribute for polymorphic associations.  Closes #10753 [railsjitsu]
 
\* Fixtures: removed support for the ancient pre-YAML file format.  #10736 [John Barnette]
 
\* More thoroughly quote table names.  #10698 [dimdenis, lotswholetime, Jeremy Kemper]
 
\* update\_all ignores scoped :order and :limit, so post.comments.update\_all doesn't try to include the comment order in the update statement.  #10686 [Brendan Ribera]
 
\* Added ActiveRecord::Base.cache\_key to make it easier to cache Active Records in combination with the new ActiveSupport::Cache::\* libraries [DHH]
 
\* Make sure CSV fixtures are compatible with ruby 1.9's new csv implementation. [JEG2]
 
\* Added by parameter to increment, decrement, and their bang varieties so you can do player1.increment!(:points, 5) #10542 [Sam]
 
\* Optimize ActiveRecord::Base#exists? to use #select\_all instead of #find.  Closes #10605 [jamesh, fcheung, protocool]
 
\* Don't unnecessarily load has\_many associations in after\_update callbacks.  Closes #6822 [stopdropandrew, canadaduane]
 
\* Eager belongs\_to :include infers the foreign key from the association name rather than the class name.  #10517 [Jonathan Viney]
 
\* SQLite: fix rename\_ and remove\_column for columns with unique indexes.  #10576 [Brandon Keepers]
 
\* Ruby 1.9 compatibility.  #10655 [Jeremy Kemper, Dirkjan Bussink]