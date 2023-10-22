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

        ~ loungeDialogue(characters.Quello)
TODO: Rifare: viene suggerito un tema per la giornata, da interpretare. Qui è: qualcosa che mangeresti tutti i giorni.
    DOGRON: Buongiorno persone concorrenti, e benvenute a questa prima puntata di NOMEPROGRAMMA! Oggi vi metteremo alla prova cucinando qualcosa di molto molto semplice: del pane.
    DOGRON: Quuuuuuuuanto è buono il pane, vero?
    DOGRON: Avete a disposizione qualche minuto per chiacchierare tra voi, prima di buttarvi in cucina. Tradotto nelle regole del programma: un massimo di tre persone!
        TODO: far dichiare un numero di persone coerente con la presenza del bonus +1 nel caso.
    DOGRON: Starà a voi decidere se condividere i vostri segreti, ingannare le altre persone, o farvi dare qualcosa di buono!
    DOGRON: 
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
  
    * -> cucina_giorno_uno
  
    = UgoEMimi_choice
    //Ingredienti suggeriti: colla di pesce e frullare
        ~ loungeDialogue(characters.UgoEMimi)
        YOU: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
        ~ loungeDialogue(characters.BeBe)
    //Ingredienti suggeriti: cipolla e affettare
        BeBe: Ciao
        -> loop
    
    = Piiiietro_choice
        ~ loungeDialogue(characters.Piiiietro)
    //Ingredienti suggeriti: tonno in scatola e mescolare
        Piiiietro: Ciao
        -> loop
    
    = Quello_choice
        ~ loungeDialogue(characters.Quello)
    //Ingredienti suggeriti: burro e montare
        Quello: Ciao
        -> loop
    
    = IlDivo_choice
        ~ loungeDialogue(characters.ilDivo)
    //Ingredienti suggeriti: zafferanno e mantecare
    IlDivo: Ciao
    -> loop

=== cucina_giorno_uno

    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (uova, farina, saltare, sciogliere, lievitare, sale)
    //QUESTA ROBA QUI SOTTO è PER UNITY
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

-> passaggio_lounge_giorno_due