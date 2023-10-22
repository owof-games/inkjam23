/***
RECAP:
GIORNO 4: 4 ingredienti, valori 2 (solo 2), 3; AGGIUNGERE 3 AL RISULTATO
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/


=== passaggio_lounge_giorno_quattro

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
        * {num_loop_rimanenti >= 0} [@ilDivo]
          -> ilDivo_choice  
          
        * -> cucina_giorno_quattro
  
 //RICETTA RICHIESTA: qualcosa per accettare il cambiamento. 
  
    = UgoEMimi_choice
    //INGREDIENTI: Mazinga e Le orecchie di Ugo    

        you: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
    //Ingredienti: avvelenare e collare con un'etichetta: DOGRON
    BeBe: Accettare, certo. Ha ragione.
        + YOU: Tutto bene, Bebe?
        -
    BeBe: Sì sì sì, sono solo di fretta. Il cambiamento, è importante accogliere il cambiamento. Cambiare, per le mie otto, no, sette figlie. Sette.
        + YOU: Come mai citi sempre le tue figlie?
        -
    BeBe: Perché il dovere di ogni madre è proteggerle. E se fallisce, vendicarsi. Portare il cambiamento.
        + YOU: Mi devo preocuppare?
        -
    BeBe: No, tu no. Ma oggi porterò una ricetta davvero speciale, sai? Il cambiamento richiede un rischio, e per questo userò della cicuta. Un poco di <b>veleno</b>, scommettendo su quanto possa essere fatale. E il <b>collare</b> dell'assassino.
    ~ dialogue_ingredients_of_the_day += avvelenare
    ~ dialogue_ingredients_of_the_day += collareconetichetta
        + YOU: Ehm, credo di aver lasciato il gatto nel forno.
        + YOU: Forse l'aria del pianeta ti sta facendo male?
        + YOU: Ma stai sgocciolando latte?
        -
    BeBe: Accettare. Bisogna accettarlo tutto. A dopo, ciao.    
        -> loop
    
    = Piiiietro_choice
    //Ingredienti: Tonno in scatola al naturale (più punti) e cantare
        Piiiietro
        -> loop
    
    = Quello_choice
    //Ingredienti: perdonare e evolversi

        Piiiietro
        -> loop
    
    = ilDivo_choice
    //Ingredienti: iomestessomemedesimo e #selfcare
        Piiiietro
        -> loop


=== cucina_giorno_quattro

    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (pettorina, trasportino, veterinario, automobile, viaggiare, inconscio, correreneisogni)
    
    ~ temp total = 3
    ~ temp num_loop_rimanenti = 4
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
    DEBUG:ok, finito
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
    
    -> passaggio_lounge_giorno_cinque