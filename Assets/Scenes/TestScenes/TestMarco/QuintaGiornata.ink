/***
RECAP:
GIORNO 5: 5 ingredienti, valori 2 (solo 2), 3, 4
Dialogo giorno 5: il singolo personaggio rimasto ti da 3 ingredienti
ne devi sempre beccare 3**/


=== passaggio_lounge_giorno_cinque

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
          
        * -> cucina_giorno_cinque

//RICETTA RICHIESTA: Qualcosa che gridi: sarò il genitore doggo migliore al mondo!
  
    = UgoEMimi_choice
    //INGREDIENTI SUGGERITI: sventrare, emancipazione, MichelaMurgia
        you: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
    //Ingredienti suggeriti: sacrificio, Peanutbutter, collarePreferito
        BeBe
        -> loop
    
    = Piiiietro_choice
    //Ingredienti: Kate Bush, l'idea di successo, cassaPortatile
        Piiiietro
        -> loop
    
    = Quello_choice
    //Ingredienti: Padre, funghicida, mappa
        Piiiietro
        -> loop
        
    = IlDivo_choice
    //Ingredienti: "Io sono ancora grande, è la ristorazione che è diventata piccola." e aiuto e aiuto.

        Piiiietro
        -> loop



=== cucina_giorno_cinque

    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (coccolare, carezzare, pettare, grattare, dormireAssieme, protezione, noGatti)
    
    ~ temp total = 0
    ~ temp num_loop_rimanenti = 5
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
     + {num_loop_rimanenti >= 0} 4
      ~ total += 4
      -> loop 
    + {num_loop_rimanenti == -1} done
      -> end

- (end)
    DEBUG: ok, finito
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
    
    -> finale