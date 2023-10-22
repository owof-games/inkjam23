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
        * {num_loop_rimanenti >= 0} [@ilDivo]
          -> ilDivo_choice
          
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
    //Ingredienti suggeriti: sacrificio, Peanutbutter, giocattoloPreferito
    BeBe: Questa sì che è pace.
        + YOU: Che hai fatto al tuo pelo?
            BeBe: Un tributo, un grande tributo.
        + YOU: Cosa c'è sulle tue zampe?
            BeBe: Ciò che avrebbe dovuto esserci da sempre.
        + YOU: Perché hai quest'aria da dominatrix?
            BeBe: Allora inchinati a me, e prega.
        -
    BeBe: Ho capito tutto, sai? Perché sono qui.
    BeBe: Cioè, sapevo perché ero qui, ma non pensavo sarebbe stato necessario tutto questo. Tutto.
    BeBe: Tutti questi sacrifici.
        + YOU: Nel Culto anche noi facciamo un sacco di sacrifici. Poi è una palla pulire però.
        + YOU: Non ti sto seguendo. Perché sei rasata? Perché le zampe son piene di sangue? Perché mi sento su di giri?!?
        + YOU: Forse è il caso che me ne vada.
        -
    BeBe: Oggi è l'ultimo giorno. Come ti senti?
        + YOU: Non pensavo ce l'avrei fatta.
        + YOU: Vincerò quest'ultima sfida, garantito al limone!
        + YOU: Spero che Micia non abbia evocato di nuovo Pazuzo in mia assenza.
        -
    BeBe: Comunque vada, son felice di questo incontro, di questo percorso con te. Oggi porterò qualcosa di inaspettato, a DOGRON. Qualcosa che lo lascerà tremolante, terrorizzato.
        + YOU: Tipo?
        -
    BeBe: Tre doni, come i Re Magici. Come le Destiny's Child. Una storia, in fondo. Una pasta al forno, ma la pasta sarà <b>Peanutbutter</b>, il sugo il <b>giocattolo preferito</b> di DOGRON, e il forno, il <b>sacrificio</b>. Il suo.
    ~ dialogue_ingredients_of_the_day += Peanutbutter
    ~ dialogue_ingredients_of_the_day += giocattoloPreferito
    ~ dialogue_ingredients_of_the_day += sacrificio
    BeBe: Nella, ti vendicherò finalmente!
        + YOU: Vuoi uccidere DOGRON?
        + YOU: Perché non l'hai fatto prima?
        + YOU: Nella?
        -
    BeBe: Mi libererò di lui. Mi servivano le prove. Mi serviva sapere che è stato lui a trasformare Nella, la mia dolce Nella, in una busta di arrosticini.
    BeBe: Il tempo del perdono è finito. Ora è giusto il momento di Beberminator!
    BeBe: Ci vediamo dall'altra parte!
        + YOU: Dove sono? Dove cazzo sono?!?!?
        -> loop
    
    = Piiiietro_choice
    //Ingredienti: Kate Bush, l'idea di successo, cassaPortatile
        Piiiietro
        -> loop
    
    = Quello_choice
    //Ingredienti: Padre, funghicida, mappa
        Piiiietro
        -> loop
        
    = ilDivo_choice
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