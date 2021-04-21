# Versionhallinta

a) MarkDown. Tämä tehtävä on tehty MarkDownina suoraan omaan githubiini. Ensiksi, että sain gitin toimimaan minun piti kertoa sille sähköpostini, sekä nimeni. ->

	git config --global user.email "bgm099@myy.haaga-helia.fi"
	git config --global user.name "Simo Tossavainen"	

Jotta sain gitin muistamaan salasanani pidempään käytin myös seuraavaa komentoa. Salasana pysyy siis muistissa kyseisellä komennolla tasan tunnin. ->

	git config --global credential.helper "cache --timeout=3600"

Sitten kloonasin githubiin tekemäni hakemiston koneelleni, jotta pystyn muokkaamaan sitä gitillä. ->

	git clone https://github.com/simotossavainen/testingnook.git

Nyt voin tehdä muutoksia helposti gitillä omalla koneellani ja siirtää ne githubiin.

d) Git log komennon esimerkki. ->

	commit d19a67e5e768343452bf0aa67b26ae53ce5701f6 (HEAD -> main, origin/main, origin/HEAD)
	Author: Simo Tossavainen <bgm099@myy.haaga-helia.fi> 
	Date:   Wed Apr 21 06:34:56 2021 +0000    

	   h3 tehtävän luettelomerkkejä vaihdettu, sekä d) kohtaa aloitettu 

	commit ad3f30f5ebffdb33140a798df9916e48e0551c59 
	Author: Simo Tossavainen <bgm099@myy.haaga-helia.fi>
	Date:   Tue Apr 20 20:19:49 2021 +0000     

	   h3 a) kohta valmis? 

	commit 84396db870c80f502be60473338c91abc6c267e1  
	Author: Simo Tossavainen <bgm099@myy.haaga-helia.fi>
	Date:   Tue Apr 20 19:59:10 2021 +0000

	   a) kohtaa muokattu = lisätty salasanan muistaminen (tunti)

git log komento siis tulostaa lokin, joka kertoo mitä muutoksia on tehty ja mihin aikaan


git diff komennon esimerkki. ->

	simo@palvelinsimo:~/testingnook$ git diff

	diff --git a/eroavaisuus.txt b/eroavaisuus.txt
	deleted file mode 100644
	index 36ed38b..0000000
	--- a/eroavaisuus.txt
	+++ /dev/null 
	@@ -1 +0,0 @@
	-Tämä on tiedostojen tiedosto.. 

git diff komento näyttää mitä eroavaisuuksia oman koneen ja githubin kansiolla on. Jos niitä ei ole git diff komento ei tee mitään.


git blame komennon esimerkki. ->

	simo@palvelinsimo:~/testingnook$ git blame testfile.txt
 
	f2f5f761 (Simo Tossavainen  2021-04-21 07:09:18 +0000 1) testing git blame
	00000000 (Not Committed Yet 2021-04-21 07:10:43 +0000 2)
	00000000 (Not Committed Yet 2021-04-21 07:10:43 +0000 3) doing
	00000000 (Not Committed Yet 2021-04-21 07:10:43 +0000 4) some
	00000000 (Not Committed Yet 2021-04-21 07:10:43 +0000 5) changes

git blame komento siis kertoo viimeisimpien muutoksien tekijän ja muutoksien teon ajan.

e) Aloitin tehtävän poistamalla tiedoston testfile.txt gitistä komennolla. ->

	rm testfile.txt

Sitten katsoin, että se oli varmasti poistunut listaamalla tiedostot kansiossa ja näin oli käynyt.

Sen jälkeen tuhosin muutokset komennolla. ->


	simo@palvelinsimo:~/testingnook$ git reset --hard

Joka antoi vastauksen. ->
	
	HEAD is now at a64cfc8 h3 tehtävään kirjoitettu komentojen selityksiä

Kun menin tämän jälkeen katsomaan tiedostojani, oli testfile.txt palannut kansioon. 

f) Päätin, että asennan hieman internet-työkaluja saltilla.

Aloitin tekemällä /srv/salt hakemistoon uuden kansion ja vaihdoin paikkaa sinne. ->

	simo@palvelinsimo:/srv/salt$ sudo mkdir internet-tools
	simo@palvelinsimo:/srv/salt$ cd internet-tools

Sitten tein kansioon init.sls tiedoston. ->

	simo@palvelinsimo:/srv/salt/internet-tools$ sudoedit init.sls

init.sls tiedostoon kirjoitin näin. ->

	pkg.installed:
	  pkgs:
	    - wikit
	    - googler
	    - browsh

Ennen kun ajoin kyseisen komennon, kokeilin, että salt toimii. ->

	simo@palvelinsimo:~$ sudo salt '*' cmd.run hostname
	palvelinsimo:
	    palvelinsimo

Se toimi, joten kokeilin internet-tools tilaa. ->

	simo@palvelinsimo:~/testingnook$ sudo salt '*' state.apply internet-tools
	palvelinsimo:
	Data failed to compile:
	----------
	Too many functions declared in state 'pkgs' in SLS 'internet-tools'
	ERROR: Minions returned with non-zero exit code


Huomasin muutamat virheet init.sls tiedostossa, jotka korjasin. ->

	internet-tools:
	  pkg.installed:
	    - pkgs:
	      - wikit
	      - googler
	      - browsh

Näiden muutosten jälkeen kävi näin, kun annoin taas komennon käynnistää tila internet-tools. ->

	
