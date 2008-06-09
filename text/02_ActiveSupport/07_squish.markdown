##Removing whitespaces with squish method

Two new methods added to the **String** object, **squish** and **squish!**.

These methods do the same as **strip** method, removing white spaces from the beginning and ending of the text, but it goes beyond, also removing unused white spaces (more than one white space) from the middle of the text
Look the example:

	“    A    text    full    of     spaces    “.strip
	#=> “A    text    full    of     spaces”

	“    A    text    full    of     spaces    “.squish
	#=> “A text full of spaces”
