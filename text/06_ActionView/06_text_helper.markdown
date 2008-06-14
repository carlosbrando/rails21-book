## ActionView::Helpers::TextHelper

### excerpt

The **excerpt** method is a helper to find a word inside a phrase and return an abbreviation of that phrase with the number of given characters as parameters before and after the word, adding, when necessary the "…". See the following example:

	excerpt('This is an example', 'an', 5)
	# => "…s is an examp…"
	
But the problem is it was buggy. If you count, you'll see the method returned 6 chars and not 5. This bug was fixed. Look at the example of the correct output for this method:

	excerpt('This is an example', 'an', 5)
	# => "…s is an exam…"
	
###simple\_format

The **simple\_format** method basically receives as a parameter any text and formats it in a simple way to **HTML**. It takes the text and replaces line breaks (\n) by **HTML** tag "< br />". And when we have two line breaks one after other  (\n\n)  it separates the text in paragraphs using "< p>"tag.

In Rails 2.1 this method receives an additional parameter. Besides text, we are going to be able to inform which **HTML** attributes we would like "< p>" tag had. Look the examples:

	simple_format("Hello Mom!", :class => 'description')
	# => "<p class=’description’>Hello Mom!</p>"

The **HTML** attributes will be added in all "< p>" tags created by the method.