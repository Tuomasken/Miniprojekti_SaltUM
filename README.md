# Miniprojekti_SaltUM

Tässä projektissa harjoittelen käyttäjienhallintaa Salt:n herra-orja-arkkitehtuurissa. Luon kolme eri työkalua tähän tarkoitukseen. Ensimmäinen niistä on Salt-tila, jolla voin luoda käyttäjiä minionille käyttäen referenssinä Salt:n omaa tietorakennetta, pilareita (pillar). Toinen työkalu on python-pohjainen moduuli, joka kerää minionilta sen käyttäjätiedot ja vertaa niitä herrakoneen pilariin, ja antaa vertailusta tuloksen. Kolmas työkalu on Salt-tila, jolla voi poistaa minionilta käyttäjät, joiden tietoja ei löydy herrakoneen käyttäjätiedot sisältävästä pilarista.

Tämä projekti on osa kurssia https://terokarvinen.com/palvelinten-hallinta/ ja tarkempi raportti sen kulusta löytyy täältä: 
