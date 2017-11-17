all:

clean:
	rm -f work/*

stellarium: clean
	stellarium --startup-script $(PWD)/star-trail.ssc --screenshot-dir $(PWD)/work --landscape schmoelenerduene

centercrop:
	./centercrop.sh