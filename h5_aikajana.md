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


b) Tässä lisään Microsoftin pakettivaraston ja asennan Visual Studio Coden

Ensin etsin netistä tietoa, miten microsoftin pakettivarasto asennetaan ja löysinkin nopeasti oikeat komennot tehdä se.->

	simo@palvelinsimo:~$ curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	[sudo] password for simo:
	OK
	
	simo@palvelinsimo:~$ sudo apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
	Hit:1 http://fi.archive.ubuntu.com/ubuntu focal InRelease
	Get:2 http://fi.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
	Get:3 http://fi.archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
	Get:4 http://fi.archive.ubuntu.com/ubuntu focal-security InRelease [109 kB]
	Hit:5 https://repo.saltproject.io/py3/ubuntu/20.04/amd64/3003 focal InRelease
	Get:6 http://fi.archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [953 kB]
	Get:7 http://fi.archive.ubuntu.com/ubuntu focal-updates/main amd64 DEP-11 Metadata [265 kB]
	Get:8 http://fi.archive.ubuntu.com/ubuntu focal-updates/main DEP-11 48x48 Icons [55.6 kB]
	Get:9 http://fi.archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [765 kB]
	Get:10 http://fi.archive.ubuntu.com/ubuntu focal-updates/universe amd64 DEP-11 Metadata [303 kB]
	Get:11 http://fi.archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 DEP-11 Metadata [2,468 B]
	Get:12 http://fi.archive.ubuntu.com/ubuntu focal-backports/universe amd64 DEP-11 Metadata [1,768 B]
	Get:13 https://packages.microsoft.com/ubuntu/20.04/prod focal InRelease [10.5 kB]
	Get:14 http://fi.archive.ubuntu.com/ubuntu focal-security/main amd64 DEP-11 Metadata [24.4 kB]
	Get:15 http://fi.archive.ubuntu.com/ubuntu focal-security/universe amd64 DEP-11 Metadata [58.3 kB]
	Get:16 https://packages.microsoft.com/ubuntu/20.04/prod focal/main amd64 Packages [68.2 kB]
	Fetched 2,830 kB in 3s (1,109 kB/s)
	Reading package lists... Done


Visual Studio Coden asentaminen kävi tämän jälkeen kätevästi käyttämällä seuraavaa komentoa.->

	simo@palvelinsimo:~/testingnook$ sudo snap install --classic code
	code 3c4e3df9 from Visual Studio Code (vscode) installed

Ohjelma asentui hyvin. 

c) CSI Pasila, aikajanoista hieman.

Esimerkki aikajanasta.->
	
	
	2021-05-05+07:50:47.3972230990 ./apt/sources.list.d/salt.list.save
	2021-05-05+07:50:47.3972230990 ./apt/sources.list.save
	2021-05-05+07:50:47.4292225660 ./apt/sources.list
	2021-05-05+07:50:47.4292225660 ./apt/sources.list.d/salt.list
	2021-05-05+08:08:50.2948464210 ./systemd/system/snap-core-10958.mount
	2021-05-05+08:08:50.8348401730 ./systemd/system/multi-user.target.wants/snap-core-10958.mount
	2021-05-05+08:09:25.5664390170 ./systemd/system/snap-code-62.mount
	2021-05-05+08:09:25.5744389250 ./systemd/system
	2021-05-05+08:09:26.3144303950 ./systemd/system/multi-user.target.wants
	2021-05-05+08:09:26.3144303950 ./systemd/system/multi-user.target.wants/snap-code-62.mount
	


c)

d)


