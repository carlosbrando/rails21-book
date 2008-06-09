## JSON escape

**json\_escape** method works like **html\_escape**. It's very useful when we need to show **JSON** strings in a **HTML** page, for example, in a documentation process.

	puts json_escape("is a > 0 & a < 10?")
	# => is a \u003E 0 \u0026 a \u003C 10?

We can also use the shortcut **j** when in ERB:

	<%= j @person.to_json %>

If you want all **JSON** code to be 'escaped' by default, include the following line in your *environment.rb* file:

	ActiveSupport.escape_html_entities_in_json = true
