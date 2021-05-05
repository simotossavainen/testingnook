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
	  pkgs.installed:
	    - pkgs:
	      - tree
	      - vlc
	      - nmap
	      - libreoffice
	      - firefox
	      - eclipse ide
	      - audacity
	      - shutter
	      - evernote
	      - vivaldi



b)

c)

d)


