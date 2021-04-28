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

b)

c)

d)

e)

e)
