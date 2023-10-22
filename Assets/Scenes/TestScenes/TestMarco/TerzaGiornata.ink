/***
RECAP:
GIORNO 3: 4 ingredienti, valori 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

=== passaggio_lounge_giorno_tre

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
          
        * -> cucina_giorno_tre
      
//RICETTA RICHIESTA: qualcosa per quando ti senti triste perché tutti gli umani sono scomparsi.

    = UgoEMimi_choice
    //INGREDIENTI SUGGERITI: iverivideogiochi e canapé
    
        you: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciRichiamaConcorrenteatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
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
        Piiiietro
        -> loop
    
    = Quello_choice
    //Ingredienti: Chinotto di Savona e raccontare
        Piiiietro
        -> loop
    
    = ilDivo_choice
    //Ingredienti: selfie e interviste
        Piiiietro
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

-> passaggio_lounge_giorno_quattro