## Timestamped Migrations
              
When you are studying Rails or developing something on your own, **migrations** seem to be the best solution to all of your problems. However, when you are part of a team working on a project and have everyone creating **migrations**, you will find out (if you haven't already) that it simply does not work. That was before Rails 2.1.

When you created a **migration**, it had a number associated with it. But what happened when two people created a **migration** at the same time or, even worse, when many people started creating **migrations** and only commited later in the day ? You would end up with a bunch of **migrations** sharing the same number but different code. Conflict!
        
There were many ways to "try" to solve this problem. Many plugins were created with different approaches to solve this issue. Despite the plugins available, one thing was clear: the old way simply didn't work.     

If you were using Git, then you would be digging an even deeper hole, since your team would probably have a couple of work branches and have **migrations** in all of them. You would have serious conflict problems when merging branches.
                 
To solve this huge problem, the coreteam changed how **migration** works in Rails so it will not be referred to as a number anymore, but as a string base on the **UTC** time and following the format YYYYMMDDHHMMSS.

Also a new table called **schema_migrations** was created and it stores which **migrations** have already been invoked. That way, if anyone creates a **migration** with a smaller number, rails will **rollback** migrations until the previous version and then run everything up to the current version.

Apparently, it solves the conflict problem with **migrations**.

There is an option to disable this feature by including the following line in **environment.rb**:

	config.active_record.timestamped_migrations = false

There were also created new rake tasks to "walk through" **migrations**:

	rake db:migrate:up
	rake db:migrate:down
