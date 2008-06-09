## flash.now now works in tests

Who doesn't had headaches because of this ? The problem was that during tests we could never confirm if a message was stored in flash, because it was cleared by Rails before going to your test script.

In rails 2.1 the problem was solved. Now you can include lines like this in your tests:

	assert_equal '>value_now<', flash['test_now']
