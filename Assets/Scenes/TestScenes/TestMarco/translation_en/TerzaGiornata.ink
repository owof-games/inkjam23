/***
RECAP:
GIORNO 3: 4 ingredienti, valori 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

=== passaggio_lounge_giorno_tre

    ~ moveToLounge()
    
    -> inizio_lounge ->
    ~ temp num_loop_rimanenti = 2
//RICETTA RICHIESTA: qualcosa per quando ti senti triste perché tutti gli umani sono scomparsi.

    ~ loungeDialogue(DOGRON)
    DOGRON: Buondì a tuuuuuuuuuuuutte e benvenute alla terza puntata di THE VERY VERY VERY GOOD GOOD DOG SHOW!
    DOGRON: Non sentite un po' la tristezza? Già due persone ci hanno lasciate, e a me non va di farvi andare via, nuuuuuuuuuuuu!
    DOGRON: Ma la Suprema Chihuahua e il Gran Consiglio dei Carlini- no, nella loro saggezza loro sanno che è importante trovare la padroncina perfetta, no, la personcina perfetta per il ristorante su Satuuuuuurno!
    DOGRON: E di sicuuuuuro questa persona magnifica con delle mani magnifiche che fanno dei bellissimi pat-pat sulla testa, deve sapere fare una ricetta per...
    DOGRON: ... quando ti senti triste perché tuuuuuuutti gli uuuumani sono scomparsi!
    DOGRON: Come sempre avete qualche minuto per le chiacchiere, e poi si inizia a cuuuucinare!
    // passa alla scena lounge
    
    
    ~ dialogue_ingredients_of_the_day = ()
    
    { abilities has PNGParliExtra:
      ~ num_loop_rimanenti += 1
    }
    - (loop)
    ~ num_loop_rimanenti -= 1
    ~ loungeDialogue(DOGRON)
    
    // scelta del personaggio con cui parlare (vengono tolti in automatico quelli non più vivi)
    $
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
          
        * -> cucina_giorno_tre
      

    = UgoEMimi_choice
    //INGREDIENTI SUGGERITI: iverivideogiochi e canapé
    
    UgoEMimi: ...
        + YOU: So che me ne pentirò di dirlo, ma mi sembrate molto silenziose, oggi.
        -
    UgoEMimi: Ugo ha parlato con uno dei produtti, per il suo videogioco.
    UgoEMimi: Venditori di cianfrusaglie, sono. Ma lo sapevi che i produttori sono dei carlini?!?!
    UgoEMimi: E gli è stato detto che il progetto manca di una narrazione coerente, e di una connessione tra gameplay, narrativa ed elementi grafici.
    UgoEMimi: Mi hanno detto in sostanza che non ha senso! Che è un gioco dove accadono cose senza senso! Ma io gioco <b>i veri videogiochi</b> da sempre! Questi son carlini da walking simulator e visual novel!
        ~ dialogue_ingredients_of_the_day += iverivideogiochi
        + YOU: E ora che farete?
        -
    UgoEMimi: Oh, io cucinerò dei <b>canapé</b> mentre Ugo si riprende dal dolore.
        ~ dialogue_ingredients_of_the_day += canapé
    UgoEMimi: Io non soffro! Gli uomini non soffrono!
    UgoEMimi: E allora cosa sono, quelle lacrime?
        + YOU: Non siete spaventati per quella cosa degli umani scomparsi?
        -
    UgoEMimi: Uh, mi spiace per loro, ma non siamo mai andati d'accordo con gli umani. Non dopo il fallimento del Virtual Boy.
    UgoEMimi: Parla per te, Ugo. Personalmente ho sempre amato gli umani, mi veniva una pizzaiola buonissima quando potevo ancora cucinarli.
        + YOU: Oh, e io che temevo di esser l'unica persona ad aver mangiato carne umana!
        + YOU: Ho troppe schifezze in corpo perché la mia carne sia gustosa.
        + YOU: Credo sia giunto il momento per me di andare su Urano.
        -
        -> loop
    
    = BeBe_choice
    //Ingredienti suggeriti: mungere e cardare
    BeBe: Ehi, ciao, ero distratta e non mi sono accorta del tuo arrivo.
        + YOU: Tutto ok?
            BeBe: Oh sì certo, sono così felice di essere qui!
        + YOU: Nel culto dicono: "La distrazione è il dono di Belial".
            BeBe: Belial? Culto?
        + YOU: Come mai la zampetta fasciata?
            BeBe: Uh, un errore durante la pedicure.
        -
    BeBe: Piuttosto: sei qui da tre episodi ormai, e non racconti molto di te. Ti va di confidarmi qualcosa, qualcosa che rimarrà tra te e me?
        + YOU: Quando sogno vedo l'arrivo dell'Apocalisse, e tutti i Cavallieri dell'Apocalisse hanno il volto di Barbara d'Urso.
            BeBe: Credo sia una cosa comune dopo la cacciata da Pomeriggio 5.
        + YOU: Sono la seconda persona più importante del fanclub di Gabriella Golia.
            BeBe: Chi?
        + YOU: Non so come mai sono qui, temo sia una punizione del culto per quell'errore con Ermenegildo.
            BeBe: Sembri una persona molto confusa, sai?
        -
    BeBe: Ma, non trovi un po' strano il tema di oggi? In che senso "gli umani sono tutti scomparsi"? E poi cosa sono gli umani?
        + YOU: Ehm, io sono una persona umana?
        -
    BeBe: Uh, ecco perché quella faccia senza peli, e il fatto che non rumini! Che buffo. E da dove vieni ci sono anche le pecore?
        + YOU: Moltissime, sono tra gli animali più diffusi.
        -
    BeBe: In che senso, animali? Certo, deve essere un luogo evoluto, con così tante pecore, bene bene!
        + YOU: Le alleviamo per mangiarle, fare la lana, farci il latte.
            BeBe: Ah. Mi sa che torno alle mie cose. Ciao. -> loop
        + YOU: Sì, esatto, molto evoluto, ehm.
        + YOU: Beh, sono ottimi animali sacrificali per il Culto!
            BeBe: In che senso? No, non lo voglio sapere. Non voglio.
        -
    BeBe: Oggi voglio colpire DOGRON: la scomparsa comporta sofferenza, e la sofferenza si supera col dolore. Per questo cucinerò qualcosa <b>mungendomi</b> e poi <b>cardando</b> la mia stessa lana.
    ~ dialogue_ingredients_of_the_day += mungere
    ~ dialogue_ingredients_of_the_day += cardare
    BeBe: Per questo ti saluto ora, e ti auguro il meglio.
        -> loop
    
    = Piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: Eppure ero sicura che fosse un RE minore.
        + YOU: Come, scusa?
        + YOU: Eri sotto di un semitono.
        + YOU: Ok, Carlo fa un po' cacare, però chiamarlo Re minore è crudele!
        -
    Piiiietro: Ma che tu entri sembre così, nelle stanze degli altri? Che cosa tamarra!
        + YOU: A dire il vero questa è la lounge, ed è comune. Ma perché tu hai una stanza tua?
        -
    Piiiietro: Certo, sennò dove lo piazzavo il lettino UV e il sistema di casse?
        + YOU: Ti prego ti prego dammi qualcosa che sembri del sole per un'ora!
            Piiiietro: E se poi mi attacchi un eritema solare?!?
        + YOU: Sistema di casse? Quindi eri tu a cantare prima?
            Piiiietro: NO.
        + YOU: Ma io non ho una stanza, dormo tra le travi sopra la cucina.
            Piiiietro: E qui si vede chi ha un agente e chi no, mi dispiace!
        -
    Piiiietro: Forse comunque ci fanno fare un karaoke. Piccolo, stasera, dopo la prova. Sembra che la mia pasta con <b>tonno in scatola</b> e pure <b>scolata/b> male sia un successone. La ripropongo anche stasera!
       ~ dialogue_ingredients_of_the_day += tonno_in_scatola
        ~ dialogue_ingredients_of_the_day += scolare
        + YOU: Ma a te il tema non preoccupa, per caso?
        -
    Piiiietro: E perché dovrebbe?
        + YOU: Insomma, vedi altre persone umane?
    Piiiietro: Ehi dolcezza, parla per te! Sono un genio della matematica, un'entità astratta, la definizione stessa della sezione aurea. E vesto leopardato. Col cazzo che sono un'umana!
    Piiiietro: E ora vattene da camera mia, che devo creare un po' di drama tra BeBe e Dogron.
    
        -> loop
    
    = Quello_choice
    //Ingredienti: Chinotto di Savona e raccontare
    Quello: Che tema del cazzo.
        + YOU: Va tutto bene?
            Quello: Sì, sì, credo.
        + YOU: Sembri arrabbiato.
            Quello: No, che dici? La rabbia è VIETATA dal contratto lavorativo.
        + YOU: Questa cosa del "tutti gli umani sono scomparsi" è inquietante, non trovi?
            Quello: Si sopravvive, sai?
        -
    Quello: Oh, scusa se sono amaro.
    Quello: Fa un po' strano però pensare a un tema come questo, quando tuo padre ha fatto, ha fatto delle cose orribili.
        + YOU: In che senso?
        + YOU: Sai, anche il mio, quando è diventato uno degli Eoni...
        + YOU: Tutte noi facciamo degli errori, non trovi?
        -
    Quello: il Divo dice sempre che il lavoro risolve ogni problema però, ogni paura. Quindi mi metterò a cucinare. Pensavo che la scomparsa è una cosa amara, e potrei fare una treccia che è un <b>raccontare</b> la storia degli altri aspirapolvere come me.
    ~ dialogue_ingredients_of_the_day += raccontare
    Quello: Farla dolce ma riempirla di pezzettini di <b>Chinotto di Savona</b> che esaltino l'amaro di certe esperienze.
    ~ dialogue_ingredients_of_the_day += ChinottoDiSavona
    Quello: Un po' come quando tuo padre stermina un'intera popolazione con la sua invenzione.
        + YOU: O tuo padre aggiunge una dimensione spazio temporale al tuo pianeta perché ha litigato con l'altro tuo padre.
        -
    Quello: Esatto. Tu sì che mi capisci. Vado a pulire gli ingredienti del Divo e poi comincio la mia ricetta. Grazie per la comprensione!
        -> loop
    
    = ilDivo_choice
    //Ingredienti: selfie e interviste
    ilDivo: Trovami Quello, subito!
        + YOU: Quello chi?
        + YOU: Starà pulendo qualcosa di tuo?
        + YOU: Hai capito che non lavoro per te, vero?
        -
    ilDivo: Aveva sempre ragione mamma, alla fine le cose le devi fare da solo.
    ilDivo: Che incubo poi che questa vostra lingua c'ha solo due generi da definire.
    ilDivo: Non mi pagano abbastanza per tutto questo!
        + YOU: In che senso, due generi?
        + YOU: In che senso, da solo?
        + YOU: In che senso, TI PAGANO?!?!
        -
    ilDivo: Te lo starai chiedendo da sempre, e sì, essere ricco e famoso è dannatamente difficile. Pensa che tipo, come lo capisco se una persona mi ama?
        + YOU: Ma sei qui per il concorso di cucina, o per trovare l'amore?
        -
    ilDivo: Io? Un concorso di cucina? Ma per chi mi hai preso?!?
    ilDivo: Xi Jinping ha pagato 7.759.312.650,00 di Yuan per un <b>selfie</b> con me!
            ~ dialogue_ingredients_of_the_day += selfie
    ilDivo: Ho imparato a ricevere <b>interviste</b> prima ancora di camminare!
            ~ dialogue_ingredients_of_the_day += interviste
    ilDivo: Un concorso di cucina, tsè. Ci pensa Quello a cucinare per entrambi, che ti credi?
        + YOU: Ooooooook, è il caso che levi le tende.
        -
        -> loop


=== cucina_giorno_tre



    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (formaggio, fondere, coccole, brandina, cuccia, sgranocchiare, fidarsi, barattoloDelloYogurt)
    
    ~ temp total = 0
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

{ 
- not success && not ScampataLaMorte && abilities has SaltaMorte:
  ~ ScampataLaMorte = true
  ~ abilities -= SaltaMorte
  DOGRON: Uh, ma una persona quuuuuuuuuui ha usato la possibilità di scampare la morte, anche se ha perso! Fortunata questa persona casuale, sì sì!
- else:
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

-> passaggio_lounge_giorno_quattro
