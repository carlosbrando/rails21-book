##Removing whitespaces with squish method

Two new methods added to the **String** object, **squish** and **squish!**.

These methods do the same as **strip** method. It removes white spaces from the beginning and the end of the text. It also removes unused white-spaces (multiple white-spaces) from the middle of the text
Look the example:

	“    A    text    full    of     spaces    “.strip
	#=> “A    text    full    of     spaces”

	“    A    text    full    of     spaces    “.squish
	#=> “A text full of spaces”
