// lista di tutte le abilità possibili, verrà popolata durante il primo dialogo
LIST abilities = chiacchierona, vipera, gesu, ab4, ab5, ab6, ab7, ab8
// lista dei personaggi in vita, all'inizio dovranno essere selezionati tutti
LIST alive_characters = (dna), (gallina), pigreco

// lista di tutti gli ingredienti possibili di tutte le giornate
LIST ingredients = uova, ciabatte, pentola, noce_moscata
// variabile che tiene gli ingredienti che appaiono nella roulette russa per il giorno che stiamo giocando
VAR base_ingredients_of_the_day = ()
VAR dialogue_ingredients_of_the_day = ()

// viene impostata da unity alla fine della ricetta e ti dice se ce l'hai fatta o meno
VAR success = true

VAR viperato = false
VAR resuscitato = false

-> test_abilities




=== test_abilities

# permette di aggiungere o togliere abilità a seconda delle scelte

godron: Vuoi l'abilità chiacchierona?
* Sì
  ~ abilities += chiacchierona
* No
* Proprio no
-
{ LIST_COUNT(abilities) >= 3:
  -> passaggio_lounge
}

godron: Vuoi l'abilità vipera?
* Sì
  ~ abilities += vipera
* No
* No
-
{ LIST_COUNT(abilities) >= 3:
  -> passaggio_lounge
}

TODO: aggiungere le altre abilità

godron: Complimenti, sei riuscita a non scegliere neanche un'abilità!
- (loop)
{ LIST_COUNT(abilities) < 3:
    ~ temp value = RANDOM(1, 8)
    ~ temp ability = abilities(value)
    ~ abilities += ability
    -> loop
- else:
    godron: Ti ho dato {abilities}
    -> passaggio_lounge
}

-> END






=== passaggio_lounge

~ dialogue_ingredients_of_the_day = ()

~ temp num_loop_rimanenti = 2
{ abilities has chiacchierona:
  ~ num_loop_rimanenti += 1
}
- (loop)
~ num_loop_rimanenti -= 1
// passa alla scena lounge
@lounge

-> inizio_lounge ->

@lounge
// scelta del personaggio con cui parlare (vengono tolti in automatico quelli non più vivi)
* {num_loop_rimanenti >= 0} [@gallina]
  -> gallina_choice
* {num_loop_rimanenti >= 0} [@dna]
  -> dna_choice
* {num_loop_rimanenti >= 0} [@pigreco]
  -> pigreco_choice
* -> test_cucina
  

= dna_choice
you: ciao
dna: ciao a te!
dna: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
~ dialogue_ingredients_of_the_day += ciabatte
-> loop

= gallina_choice
gallina
-> loop

= pigreco_choice
pigreco
-> loop


=== passaggio_lounge_dogron

@lounge
@dogron

DOGRON: eccoci qua!

-> END







=== remove_random_ability

~ abilities = (chiacchierona, vipera, gesu, ab4, ab5, ab6)

~ temp value = RANDOM(1, 8)
~ temp ability = abilities(value)
~ abilities -= ability

Fatto!

-> END








=== test_cucina

// passa alla scena della cucina
@kitchen
// imposta gli ingredienti a disposizione per questa giornata
~ base_ingredients_of_the_day = (uova, pentola)

~ temp total = 0
~ temp num_loop_rimanenti = 3
- (loop)
~ num_loop_rimanenti -= 1
Total è {total}
@kitchen_choice
+ {num_loop_rimanenti >= 0} 1
  ~ total += 1
  -> loop
+ {num_loop_rimanenti >= 0} 2
  ~ total += 2
  -> loop
+ {num_loop_rimanenti >= 0} 3
  ~ total += 3
  -> loop
+ {num_loop_rimanenti == -1} done
  -> end

- (end)
ok, finito
{ not success:
  -> non_ce_lhai_fatta
}
{
  - total >= 7:
    -> finale_strano
  - total >= 4:
    -> finale_intermedio
  - else:
    -> finale_normale
}


-> END

=== non_ce_lhai_fatta
-> END

=== finale_strano
-> END

=== finale_intermedio
-> END

=== finale_normale
-> END





=== finale ===
// si usa per il finale del gioco, e per il finale delle giornate
@endroom

Parla Dogron e dice cose. 

-> END





=== function translate_ingredient(ingredient) ===
{ ingredient:
- ciabatte: ciabatte
- uova: uova
- pentola: pentola
- noce_moscata: noce moscata
}

=== function value_ingredient(ingredient) ===
{ ingredient:
- ciabatte: 2
- uova: 1
- pentola: 2
- noce_moscata: 1
}





=== inizio_lounge ===

@lounge

DOGRON: eccoci con la nostra concorrente
{ abilities has chiacchierona:
  DOGRON: è incredibile quanto parli! ...
}

DOGRON: ti vedo stanca, hai perso un'abilità?
~ temp value = RANDOM(1, 8)
~ temp ability = abilities(value)
{ ability:
  - chiacchierona: DOGRON: Non sei più una chiacchierona!
  // ecc ecc
}
~ abilities -= ability

{ abilities has vipera and not viperato:
    -> vipera_choice ->
}

{ abilities has gesu and not resuscitato:
    -> gesu_choice ->
}

->->

= vipera_choice
DOGRON: vorrai fare la vipera con qualcuno?
* { alive_characters has gallina} gallina
    ~ alive_characters -= gallina
    DOGRON: peccato, non c'è più gallina
    ~ viperato = true
* {alive_characters has pigreco} pigreco
    ~ alive_characters -= pigreco
    ~ viperato = true
-
TODO: aggiungere gli altri
->->

= gesu_choice
DOGRON: vorrai far resuscitare qualcuno?
* { alive_characters hasnt gallina } gallina
    ~ alive_characters += gallina
    ~ resuscitato = true
    Bentornata gallina!
* { alive_characters hasnt pigreco } pigreco
    ~ alive_characters += pigreco
    ~ resuscitato = true
    Bentornata pigreco!
-
TODO: aggiungere gli altri
->->

/*
distribuzione ingredienti:


GIORNO 1: 3 ingredienti, valori 1, 2, 3
GIORNO 2: 3 ingredienti, valori 1 (solo 1), 2, 3
GIORNO 3: 4 ingredienti, valori 2, 3
GIORNO 4: 4 ingredienti, valori 2 (solo 2), 3; AGGIUNGERE 3 AL RISULTATO
GIORNO 5: 5 ingredienti, valori 2 (solo 2), 3, 4
*/

/*
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
Dialogo giorno 3: il singolo personaggio rimasto ti da 3 ingredienti
ne devi sempre beccare 3
*/