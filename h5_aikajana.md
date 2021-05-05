# h5 Aikajana

a) Tässä teen tilan, joka asentaa suosikkiohjelmani paketinhallinnasta.

Ensin menen /srv/salt hakemistoon ja teen sinne uuden kansion tilalle.->

	cd /srv/salt
	sudo mkdir favs

Sitten menen kansion sisään ja teen sinne init.sls tiedoston.->

	cd favs
	sudoedit init.sls

init.sls tiedostoon kirjoitan näin.->

	favs:
	  pkg.installed:
	    - pkgs:
	      - tree
	      - vlc
	      - nmap
	      - libreoffice
	      - firefox
	      - flameshot
	      - audacity
	      - shutter
	      - slack
	      - pidgin

Ajoin tilan.->

	simo@palvelinsimo:/etc/salt$ sudo salt '*' state.apply favs
	palvelinsimo:
	----------
	          ID: favs
	    Function: pkg.installed
	      Result: True
	     Comment: All specified packages are already installed
	     Started: 06:21:30.281931
	    Duration: 94.257 ms
	     Changes:
	
	Summary for palvelinsimo
	------------
	Succeeded: 1
	Failed:    0
	------------
	Total states run:     1
	Total run time:  94.257 ms
	
Toimii!
(Ajoin sen siis jo kerran aikaisemmin, siitä syystä ei muutoksia)


b)

c)

d)


