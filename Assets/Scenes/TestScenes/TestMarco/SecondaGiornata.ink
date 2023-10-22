/***
RECAP:
GIORNO 2: 3 ingredienti, valori 1 (solo 1), 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/


=== passaggio_lounge_giorno_due
    ~ moveToLounge()
    
    -> inizio_lounge ->
    ~ temp num_loop_rimanenti = 2
    //RICETTA RICHIESTA: un pasto per quando vengono i veri amici.

    ~ loungeDialogue(DOGRON)
    DOGRON: Ma persone amiche, siamo già alla seconda giornata di THE GOOD DOG (very very good dog!)!!! Non siete supermegafelici e scodinzolanti?!? Oh, quanto non vorrei vedervi mai andare via!
    DOGRON: Ma se non eliminassimo qualcuno, come potremmo trovare un sostituto perfetto per, per, per la cucina più grande di Urano?
    DOGRON: E a proposito di Uuuuuuuurano, il tema di oggi è: un pasto per quando vengono i veri veri amici!
    DOGRON: Vi lascio qualche minuto per le chiacchiere e poi si parte!
    // passa alla scena lounge
    
    
    ~ dialogue_ingredients_of_the_day = ()
    
    { abilities has PNGParliExtra:
      ~ num_loop_rimanenti += 1
    }
    - (loop)
    ~ num_loop_rimanenti -= 2
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
      
    * -> cucina_giorno_due
    
    
    = UgoEMimi_choice
    //Ingredienti suggeriti: Vol-au-vent e Skyrim
        you: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
    //Ingredienti: blocchi d'erba e uova di pecora (sacrificio)
    BeBe: Ma ciao! Chi l'avrebbe mai detto che sarei sopravvissuta al primo giorno? Nella non ce l'ha fatta.
    {not passaggio_lounge_giorno_uno.BeBe_choice: BeBe: Comunque ieri non ho avuto modo di presentarmi, sono BeBe, madre single di otto, ehm, sette agnelline.}
        + YOU: Nella?
            BeBe: Una lunga storia, una lunga lunga storia.
        + YOU: Perché giri con una mannaia?
            BeBe: Mannaia? Quale mannaia?
        + YOU: Mi dispiace per chi è uscito. Ma scusa, chi è uscito?!?
            BeBe:
            TODO: Se si riesce, mettere il nome di chi è stato eliminato.
        -
    BeBe: Ma parliamo di cose belle, visto il tema di oggi: hai persone amiche che ti aspettano? Io ho solo le mie otto, uh, sette figlie, e sono la loro migliore amica.
    BeBe: La migliore mamma e amica che ci sia. Farei di tutto per loro!
        + YOU: Certo, se ne sei convinta tu...
        + YOU: Ho Micia che mi aspetta a casa, lei è la mia vita.
        + YOU: Ci sono un po' di persone nel culto con cui vado d'accordo, sai? Ma non troppe.
        -
        + YOU: Hai qualche ricetta segreta su cui puntare, oggi?
        -
    BeBe: Se te la dicessi, non sarebbe segreta, non trovi?
    BeBe: Scherzo, se il tema è "cibo per persone amiche" è ovvio che condivido.
    BeBe: E tu sei una persona amica per me vero?
        + YOU: Ceeerto che sì!
        + YOU: (menti) Ceeeerto che sì!
        + YOU: (ironicamente) Ceeerto che sì!
        -
    BeBe: Questo mi rassicura. Non amo le persone che mi prendono per le orecchie.
    BeBe: Comunque, pensavo: cos'è la vera amicizia? E ovviamente ho pensato alle mie otto, ehm, sette figlie. E cosa amano fare quando siamo tutte assieme? I videogiochi!
    BeBe: Mi diverte un sacco quando dicono in modo affettuoso "No mamma, non giocare con noi stasera, ti preghiamo!". Son così tenere.
    BeBe: E quindi pensavo di fare dei cestini con dei <b>blocchi d'erba</b> fritti, e le <b>uova di pecora</b>.
    ~ dialogue_ingredients_of_the_day += blocchiDiErba
    ~ dialogue_ingredients_of_the_day += uovaDiPecora
        + YOU: Uova di pecora?
        -
    BeBe: Certo. In amicizia il sacrificio è importante!.
    BeBe: Ma ora devo andare un attimo a covare. A dopo!
        + YOU: Ehm, a dopo.
        -
        -> loop
    
    = Piiiietro_choice
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: <b>Tonno in scatola</b> e <b>scolare</b>.
       ~ dialogue_ingredients_of_the_day += tonno_in_scatola
        ~ dialogue_ingredients_of_the_day += scolare
        + YOU: Come, scusa?
        + YOU: Ah, perfetto, a dopo.
        -> loop
        + YOU: Non sai cucinare altro?
        -
    Piiiietro: Che ho visto ieri che guardavi cosa stavo cucinando. Fanno tutte così, a copiare il lavoro delle altre persone, e poi.
        + YOU: Potrebbe sorprenderti, ma cucino persino peggio di te.
            Piiiietro: Non esageriamo, ho visto cosa hai tirato fuori ieri!
        + YOU: Hai trovato poi il tuo cane?
            Piiiietro: No, e ho trovato la sua pelliccia di zibellino russo abbandonata dietro una poltrona.
            Piiiietro: Ma fa sempre così, quando gli vieto di andare in vacanza da qualche parte.
        + YOU: Ma il rosario poi?
            Piiiietro: Credo di averlo visto addosso a Dogron, dovrò indagare meglio.
        -
    Piiiietro: Comunque ieri la produzione mi ha detto che non me ne posso andare, che ho firmato un contratto, e che se l'errore è del mio agente a loro non cambia nulla.
        + YOU: Agente?
        -
    Piiiietro: Agente matematico. Facciamo sfide tipo come il rap, ma a suon di equazioni. Non sembra ma è superfaticoso, l'anno scorso due concorrenti sono morti disidratati pur di finire, oh, non ricordo manco cosa, tanto vinco sempre.
    Piiiietro: Sono così brava in matematica.
    Piiiietro: Ma ora ti saluto, che devo sistemare i diamantini sui denti prima dell'episodio.
        -> loop
        
    = Quello_choice
    //Ingredienti: lacrime e cacao amaro
    {not passaggio_lounge_giorno_uno.Quello_choice: Quello: Ciao! Io sono Quello, o Quello Lì a volte. Ti guardavo cucinare ieri e woah, te la cavi benissimo!}
    Quello: Io sono un po' in difficoltà oggi, sai?
    Quello: Tutti i miei "veri amici" sono morti, sai?
        + YOU: Ma come quella battuta sui dinosauri?
        + YOU: Questo è il momento in cui devo dire che mi dispiace, vero?
        + YOU: Ho visto una pecora molto amichevole prima. Se vuoi parlare con lei...
        -
    Quello: Non ti ammorbo con questa storia triste, promesso. Però non riesco a non pensare a ricette che non abbiano delle <b>lacrime</b>. Un sacco.
    ~ dialogue_ingredients_of_the_day += lacrime
        + YOU: Non rovinano il sapore?
        -
    Quello: Dipende. Con il <b>cacao amaro</b> il salato ci sta bene. Potrei fare una torta.
    ~ dialogue_ingredients_of_the_day += cacaoAmaro
    Quello: Una torta da non dividere con nessuna persona.
    Quello: A parte il Divo, che non mangerebbe però mai, perché gli farebbe schifo sulla fiducia. E ha ragione.
    Quello: Scusa, la tristezza è vietata dal contratto di lavoro. A dopo, in bocca al lupo!
        -> loop
    
    = ilDivo_choice
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