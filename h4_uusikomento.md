# H4 Uusi komento

a)Tein hei maailman (tässä tapauksessa tiedosto nimeltä hellow), joka tulostaa tekstin "Hello Finland!"

Ensin loin tiedoston hellow /usr/local/bin hakemistoon->

	cd /usr/local/bin
	nano hellow

Sitten kirjoitin hellow tiedoston sisään seuraavasti->

	#!/bin/bash

	echo "Hello Finland!"

Sitten muokkasin tiedoston/skriptin ajamisoikeuttta->

	sudo chmod ugo+x hellow

Jonka jälkeen listasin tiedostot kyseisessa hakemistossa (/usr/local/bin), josta löysin hellow skriptin oikeilla oikeuksilla.

	-rwxr-xr-x  1 root root   36 Apr 28 07:00 hellow

Sitten tein saman automatisoiden. Ensin tein salttiin uuden kansion.->

        cd /srv/salt
        sudo mkdir helloworld

Sitten tein sinne init.sls tiedoston ja siirsin jo tekemäni hellow skriptin helloworld kansioon.

        cd helloworld
        sudo mv /usr/local/bin/hellow .
        sudoedit init.sls

init.sls tiedostoon kirjoitin näin.->

        /usr/local/bin/hellow:
          file.managed:
            - source: salt://helloworld/hellow
            - mode: 755

Sitten ajoin tiedoston.->

        sudo salt '*' state.apply hellow

Joka antoi kyseisen vastauksen.->

	palvelinsimo:
	----------
         	 ID: /usr/local/bin/hellow
	    Function: file.managed
	      Result: True
	     Comment: File /usr/local/bin/hellow updated
	     Started: 07:48:42.331529
	    Duration: 25.854 ms
	     Changes:
	              ----------
        	      diff:
                	  New file
             	 mode:
                	  0755

	Summary for palvelinsimo
	------------
	Succeeded: 1 (changed=1)
	Failed:    0
	------------
	Total states run:     1
	Total run time:  25.854 ms

b) Seuraavaksi asensin whatsup.sh tiedoston orjille saltilla, joka kertoo ajankohtaisia tietoja. Tässä tapauksessa se kertoo sään ja päivämäärän.

Tein saltille ensin uuden kansion.->

	cd /srv/salt
	sudo mkdir whatsup

Sitten Lisäsin kansioon init.sls tiedoston.->

	cd whatsup
	sudoedit init.sls

Sinne kirjoitin seuraavasti.->

	/usr/local/bin/whatsup.sh:
	  file.managed:
	    - source: salt://whatsup/whatsup.sh
	    - mode: 755

Sitten tein itse whatsup.sh tiedoston/skriptin

	sudoedit whatsup.sh

Sinne kirjoitin seuraavasti.->

	#!/bin/bash

	curl wttr.in/Helsinki
	date

Seuraavaksi menin ajamaan salt tilan.->

	simo@palvelinsimo:~$ sudo salt '*' state.apply whatsup
	palvelinsimo:
	----------
	          ID: /usr/local/bin/whatsup.sh
	    Function: file.managed
	      Result: True
	     Comment: File /usr/local/bin/whatsup.sh updated
	     Started: 04:08:01.843695
	    Duration: 31.599 ms
	     Changes:
	              ----------
	              diff:
	                  New file
	              mode:
	                  0755

	Summary for palvelinsimo
	------------
	Succeeded: 1 (changed=1)
	Failed:    0
	------------
	Total states run:     1
	Total run time:  31.599 ms

Tila toimi hyvin. :)

c)Seuraavaksi teen python skriptin ja asennan sen orjille saltilla.

Aloitin tekemällä salttiin uuden kansion.->

	cd /srv/salt
	sudo mkdir hellopython

Sitten menin kansioon ja tein sinne python skriptin.->

	cd hellopython
	sudoedit hello.py

hello.py tiedostoon kirjoitin näin.->

	#!/usr/bin/python3

	print("Hei Simo! Pythonia vaihteeksi!")

Sitten tein init.sls tiedoston.->

	/usr/local/bin/hello.py:
	  file.managed:
	    source: salt://hellopython/hello.py
	    mode: 755

Sitten ajoin salt tilan.->

	simo@palvelinsimo:~$ sudo salt '*' state.apply hellopython
	palvelinsimo:
	----------
	          ID: /usr/local/bin/hello.py
	    Function: file.managed
	      Result: True
	     Comment: File /usr/local/bin/hello.py updated
	     Started: 11:47:59.730838
	    Duration: 99.757 ms
	     Changes:
	              ----------
	              diff:
	                  New file
	              mode:
	                  0755

	Summary for palvelinsimo
	------------
	Succeeded: 1 (changed=1)
	Failed:    0
	------------
	Total states run:     1
	Total run time:  99.757 ms

Tila toimi onnistuneesti. :)

Sitten menin kokeilemaan skriptin ajamista. ->

        simo@palvelinsimo:~$ hello.py
        /usr/local/bin/hello.py: line 4: syntax error near unexpected token `"Hei Simo! Pythonia vaihteeksi!"'
        /usr/local/bin/hello.py: line 4: `print("Hei Simo! Pythonia vaihteeksi!")'

Sain tuon näköisen virhekoodin, jonka jälkeen menin tarkistamaan init.sls tiedostoa, sekä hello.py tiedostoa.
Tässä kävikin hassusti sillä tavalla, että en ole varma mitä muokkasin, mutta ohjelma korjaantui kuin itsestään.

Ajoin siis hello.py:n uudestaan ja vastaus oli tämä. .>

	

d)

e)

e)
