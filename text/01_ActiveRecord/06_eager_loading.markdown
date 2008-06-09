##Eager Loading

To explain this new funcionality, let's look at the following code:

	Author.find(:all, :include => [:posts, :comments])
	
I'm searching through table **authors** and also including tables **posts** and **comments** in my query through the **author_id** column, which is the default column name according to Rails' convention for foreign_key names. 
This search used to generate SQL queries like this:

	SELECT
	  authors."id"          AS t0_r0,
	  authors."created_at"  AS t0_r1,
	  authors."updated_at"  AS t0_r2,
	  posts."id"            AS t1_r0,
	  posts."author_id"     AS t1_r1,
	  posts."created_at"    AS t1_r2,
	  posts."updated_at"    AS t1_r3,
	  comments."id"         AS t2_r0,
	  comments."author_id"  AS t2_r1,
	  comments."created_at" AS t2_r2,
	  comments."updated_at" AS t2_r3
	FROM
	  authors
	  LEFT OUTER JOIN posts ON posts.author_id = authors.id
	  LEFT OUTER JOIN comments ON comments.author_id = authors.id

Exactly one long SQL query with **joins** between tables **authors**, **posts** and **comments**. We call this **cartesian product**.	

This type of query is not always good performance-wise, so it was changed for Rails 2.1. The same query for **Author** class now uses a different approach to retrieve information from all three tables. Instead of using one SQL query with all three tables, Rails now uses three different queries - one for each table - which are shorter queries than the former that used to be generated. The result can be seen in the log after executing the previous ruby on rails code:

	SELECT * FROM "authors"
	SELECT posts.* FROM "posts" WHERE (posts.author_id IN (1))
	SELECT comments.* FROM "comments" WHERE (comments.author_id IN (1))

In **most cases** three simpler queries will run faster than a complex and long query.
