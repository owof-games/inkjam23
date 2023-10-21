/***
RECAP:
GIORNO 1: 3 ingredienti, valori 1, 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

=== passaggio_lounge_giorno_uno

~ dialogue_ingredients_of_the_day = ()

~ temp num_loop_rimanenti = 2
{ abilities has PNGParliExtra:
  ~ num_loop_rimanenti += 1
}
- (loop)
~ num_loop_rimanenti -= 1
// passa alla scena lounge
~ moveToLounge()

-> inizio_lounge ->

~ moveToLounge()
// scelta del personaggio con cui parlare (vengono tolti in automatico quelli non più vivi)
* {num_loop_rimanenti >= 0} [@BeBe]
  -> BeBe_choice
* {num_loop_rimanenti >= 0} [@UgoEMimi]
  -> UgoEMimi_choice
* {num_loop_rimanenti >= 0} [@Piiiietro]
  -> Piiiietro_choice
  TODO: aggiungi PNG
  
* -> cucina_giorno_uno
  
TODO: choice PNG (stich)
= UgoEMimi_choice
you: ciao
UgoEMimi: ciao a te!
UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
~ dialogue_ingredients_of_the_day += uova
-> loop

= BeBe_choice
BeBe
-> loop

= Piiiietro_choice
Piiiietro
-> loop



=== cucina_giorno_uno

// passa alla scena della cucina
~ moveToKitchen()
// imposta gli ingredienti a disposizione per questa giornata
~ base_ingredients_of_the_day = (uova, pentola)

~ temp total = 0
~ temp num_loop_rimanenti = 3
- (loop)
~ num_loop_rimanenti -= 1
Total è {total}
#kitchen_choice
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
  - total >= 15:
    -> finale_cinque ->
  - total >= 12:
    -> finale_quattro ->
  - total >= 9:
    -> finale_tre ->
-   total >= 6:
    -> finale_due ->
    - else:
    -> finale_uno ->
}

-> passaggio_lounge_giorno_due