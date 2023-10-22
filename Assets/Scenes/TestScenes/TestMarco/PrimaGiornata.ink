/***
RECAP:
GIORNO 1: 3 ingredienti, valori 1, 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

=== passaggio_lounge_giorno_uno

    // passa alla scena lounge
    ~ moveToLounge()
    -> inizio_lounge ->

    ~ temp num_loop_rimanenti = 2
    
    ~ loungeDialogue(DOGRON)
    DOGRON: Buongiorno persone concorrenti, e benvenute a questa prima puntata di NOMEPROGRAMMA! Oggi vi metteremo alla prova chiedendovi di...
    DOGRON: Cucinare qualcosa che mangereste tutti i giorni!
    DOGRON: Avete a disposizione qualche minuto per chiacchierare tra voi, prima di buttarvi in cucina. Tradotto nelle regole del programma: un massimo di {num_loop_rimanenti+1} persone!
    DOGRON: Starà a voi decidere se condividere i vostri segreti, ingannare le altre persone, o farvi dare dei grattini!

    ~ dialogue_ingredients_of_the_day = ()
    
    { abilities has PNGParliExtra:
      ~ num_loop_rimanenti += 1
    }
    - (loop)
    ~ num_loop_rimanenti -= 1
    

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
        ~ loungeDialogue(UgoEMimi)
        YOU: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
    //Ingredienti suggeriti: cipolla e affettare
    ~ loungeDialogue(BeBe)
    BEBE: Eppure ero sicura di averli messi qui, acciderbolina!
        + YOU: Hai perso qualcosa?
        -
    BEBE: I miei occhiali da sole! Non mi piace andare in giro senza.
        + YOU: Li hai addosso, sai?
            BEBE: Uh, che distratta che sono! Sai, avere otto, ehm, sette figlie rende tutto difficile.
        + YOU: Ma non c'è il sole qui. Forse manco su tutto il pianeta.
            BEBE: Però c'è dell'erba, ne sento l'odore!
        + YOU: Mmm sì sì certo.
            BEBE: Stai citando quel nuovo gruppo K-Pop?
        -
    BEBE: Ma come ti stai trovando qui, dolcezza? Hai tutto quello di cui hai bisogno?
        + YOU: Non so dove sono, vorrei solo scappare.
            BEBE: Se vinco, ti prometto che ti porterò con me, ho ancora una cameretta libera!
        + YOU: L'ultima volta che ho cucinato, la mia casa è esplosa.
            BEBE: Succede a tutte le persone, prima o poi.
        + YOU: Non dovrei essere qui. Il Culto mi sta cercando.
            BEBE: Culto?
        -
        + YOU: Piuttosto, cosa hai deciso di cucinare per la prima puntata?
        -
    BEBE: Uh sai, pur essendo una pecora in carriera, essere una madre single di otto, uffa, sette agnelline ti obbliga a fare i conti coi soldi.
    BEBE: Per cui penso preparerò della zuppa di pane e <b>cipolla</b> da <b>affettare</b>.
    BEBE: La cipolla rende tutto buonissimo, e non costa niente.
        + YOU: Uh, ora capisco l'alito.
        + YOU: Io son più persona da snack, sai?
        + YOU: Grazie del consiglio.
        -
    BEBE: Comunque non mi sono presentata! Sono Bebe. Ora vado a prepararmi per la fase di cucina, spero di ritrovarti presto!
        + YOU: Buona fortuna.
        + YOU: Ti batterò.
        + YOU: Come si esce da qui?!?!?
        -
        -> loop
    
    = Piiiietro_choice
    ~ loungeDialogue(Piiiietro)
    //Ingredienti suggeriti: tonno in scatola e mescolare
        Piiiietro
        -> loop
    
    = Quello_choice
    ~ loungeDialogue(Quello)
    //Ingredienti suggeriti: burro e montare
        Quello
        -> loop
    
    = IlDivo_choice
    ~ loungeDialogue(ilDivo)
    //Ingredienti suggeriti: zafferanno e mantecare
    IlDivo
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