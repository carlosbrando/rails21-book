## Scripts

### plugin

The command *script/plugin install* now allows the use of –e/--export option, so that it issues a svn export. 
Added support for plugins hosted in GIT repositories.


### dbconsole

This script does the same thing as script/console but for your database. In other words it connects to the command line client of your database.

Looking at the code, this apparently will only work for mysql, postgresql and sqlite(3). When another database is configured in database.yml, this script will show: "not supported for this database type".
