## gems:build

The **gems:build** task compiles all native extensions of gems which were installed through **gems:unpack**. The syntax is the following:

	rake gems:build # For all gems
	rake gems:build GEM=mygem # I'm specifing the gem
