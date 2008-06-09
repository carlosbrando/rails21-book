## Tasks

### rails:update

From now on everytime you run the task **rake rails:freeze:edge** it will also run **rails:update**, updating the config files and *JavaScripts*.

### Database in 127.0.0.1

A change was made in the file databases.rake that used to look only in localhost for local databases, it will now also consider the IP **127.0.0.1**. This works for both **create** and **drop** tasks. The databases.rake file was also refactored to make the code less repetitive.

### Freezing a specific Rails release.

Until Rails 2.1 it wasn't possible to freeze a specific Rails release inside your project, you could only use its Revision as a parameter. In Rails 2.1, we can freeze a specific release using the command below:

	rake rails:freeze:edge RELEASE=1.2.0

## TimeZone

#### rake time:zones:all

Return all the time zones known to Rails, grouped by offset. You can also filter the return value using the optional parameter OFFSET, for instance: OFFSET=-6.

#### rake time:zones:us

Shows a list with all US time zones. The OFFSET option is still valid here.

#### rake time:zones:local

Return all the time zones known to Rails that are in the same offset of your OS.
