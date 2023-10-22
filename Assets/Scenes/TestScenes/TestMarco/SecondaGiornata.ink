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
    BEBE: Ma ciao! Chi l'avrebbe mai detto che sarei sopravvissuta al primo giorno? Nella non ce l'ha fatta.
    {not passaggio_lounge_giorno_uno.BeBe_choice: BEBE: Comunque ieri non ho avuto modo di presentarmi, sono BeBe, madre single di otto, ehm, sette agnelline.}
        + YOU: Nella?
            BEBE: Una lunga storia, una lunga lunga storia.
        + YOU: Perché giri con una mannaia?
            BEBE: Mannaia? Quale mannaia?
        + YOU: Mi dispiace per chi è uscito. Ma scusa, chi è uscito?!?
            BEBE:
            TODO: Se si riesce, mettere il nome di chi è stato eliminato.
        -
    BEBE: Ma parliamo di cose belle, visto il tema di oggi: hai persone amiche che ti aspettano? Io ho solo le mie otto, uh, sette figlie, e sono la loro migliore amica.
    BEBE: La migliore mamma e amica che ci sia. Farei di tutto per loro!
        + YOU: Certo, se ne sei convinta tu...
        + YOU: Ho Micia che mi aspetta a casa, lei è la mia vita.
        + YOU: Ci sono un po' di persone nel culto con cui vado d'accordo, sai? Ma non troppe.
        -
        + YOU: Hai qualche ricetta segreta su cui puntare, oggi?
        -
    BEBE: Se te la dicessi, non sarebbe segreta, non trovi?
    BEBE: Scherzo, se il tema è "cibo per persone amiche" è ovvio che condivido.
    BEBE: E tu sei una persona amica per me vero?
        + YOU: Ceeerto che sì!
        + YOU: (menti) Ceeeerto che sì!
        + YOU: (ironicamente) Ceeerto che sì!
        -
    BEBE: Questo mi rassicura. Non amo le persone che mi prendono per le orecchie.
    BEBE: Comunque, pensavo: cos'è la vera amicizia? E ovviamente ho pensato alle mie otto, ehm, sette figlie. E cosa amano fare quando siamo tutte assieme? I videogiochi!
    BEBE: Mi diverte un sacco quando dicono in modo affettuoso "No mamma, non giocare con noi stasera, ti preghiamo!". Son così tenere.
    BEBE: E quindi pensavo di fare dei cestini con dei <b>blocchi d'erba</b> fritti, e le <b>uova di pecora</b>.
        + YOU: Uova di pecora?
        -
    BEBE: Certo. In amicizia il sacrificio è importante!.
    BEBE: Ma ora devo andare un attimo a covare. A dopo!
        + YOU: Ehm, a dopo.
        -
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