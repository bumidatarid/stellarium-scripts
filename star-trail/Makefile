all:

clean:
	rm -f work/*

stellarium: clean
	stellarium --startup-script $(PWD)/star-trail.ssc --screenshot-dir $(PWD)/work --landscape schmoelenerduene
	#stellarium --startup-script $(PWD)/star-trail.ssc --screenshot-dir $(PWD)/work --landscape schmoelenerduene --full-screen no --config-file $(PWD)/config.ini

centercrop:
	./centercrop.sh
