/***
RECAP:
GIORNO 1: 3 ingredienti, valori 1, 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

=== passaggio_lounge

~ dialogue_ingredients_of_the_day = ()

~ temp num_loop_rimanenti = 2
{ abilities has EvidenziaIngredienti:
  ~ num_loop_rimanenti += 1
}
- (loop)
~ num_loop_rimanenti -= 1
// passa alla scena lounge
@lounge

-> inizio_lounge ->

@lounge
// scelta del personaggio con cui parlare (vengono tolti in automatico quelli non più vivi)
* {num_loop_rimanenti >= 0} [@BeBe]
  -> BeBe_choice
* {num_loop_rimanenti >= 0} [@UgoEMimi]
  -> UgoEMimi_choice
* {num_loop_rimanenti >= 0} [@Piiiietro]
  -> Piiiietro_choice
* -> test_cucina
  

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


=== passaggio_lounge_dogron

@lounge
@dogron

DOGRON: eccoci qua!

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
