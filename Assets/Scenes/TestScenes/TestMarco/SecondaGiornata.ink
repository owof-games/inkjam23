/***
RECAP:
GIORNO 2: 3 ingredienti, valori 1 (solo 1), 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/


=== passaggio_lounge_giorno_due

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
    * {num_loop_rimanenti >= 0} [@Quello]
      -> Quello_choice
    * {num_loop_rimanenti >= 0} [@IlDivo]
      -> IlDivo_choice  
      
    * -> cucina_giorno_due
    
    //RICETTA RICHIESTA: un pasto per quando vengono i veri amici.
    
    = UgoEMimi_choice
    //Ingredienti suggeriti: Vol-au-vent e Skyrim
        you: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
    //Ingredienti: blocchi d'erba e uova di pecora (sacrificio)

        BeBe
        -> loop
    
    = Piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
        Piiiietro
        -> loop
    
    = Quello_choice
    //Ingredienti: lacrime e cacao amaro
        Piiiietro
        -> loop
    
    = IlDivo_choice
    //Ingredienti: specchiarsi e scottare
        Piiiietro
        -> loop



=== cucina_giorno_due

// passa alla scena della cucina
~ moveToKitchen()
// imposta gli ingredienti a disposizione per questa giornata
~ base_ingredients_of_the_day = (braciola, arrosticino, costina, osso, grigliare, crocchette, versare, riempire)

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

-> passaggio_lounge_giorno_tre