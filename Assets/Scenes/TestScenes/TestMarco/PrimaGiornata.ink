/***
RECAP:
GIORNO 1: 3 ingredienti, valori 1, 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

=== passaggio_lounge_giorno_uno

    // passa alla scena lounge
    ~ moveToLounge()
    -> inizio_lounge ->

    ~ temp num_loop_rimanenti = 3
    
    ~ loungeDialogue(DOGRON)
    DOGRON: Buuuuuuuuongiorno persone concorrenti, e benvenute a questa prima puntata di THE GOOD DOG SHOW! Oggi vi metteremo alla prova chiedendovi di...
    DOGRON: Cucinare qualcosa che mangereste tuuuuuuutti i giorni!
    DOGRON: Avete a disposizione qualche minuto per chiacchierare tra voi, prima di buuuuttarvi in cucina. Tradotto nelle regole del programma: un massimo di {num_loop_rimanenti+1} persone!
    DOGRON: Starà a voi decidere se condividere i vostri segreti, ingannare le altre persone, o farvi dare dei grattini! E massima attenzione, perché in THE GOOD DOG tuuuutto cambia in un battito di ciglia!

    ~ dialogue_ingredients_of_the_day = ()
    
    { abilities has PNGParliExtra:
      ~ num_loop_rimanenti += 1
    }
    - (loop)
    ~ num_loop_rimanenti -= 1
    
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
  
    * -> cucina_giorno_uno
  
    = UgoEMimi_choice
    //Ingredienti suggeriti: colla di pesce e filtrare
        ~ loungeDialogue(UgoEMimi)
    UgoEMimi: Ugo, non credo sia il caso.
    UgoEMimi: Mimi, decido IO quando è il caso. E si dia il caso che qui sono pieni di soldi e io ho bisogno di un publisher!
    UgoEMimi: Ugo, una persona ci sta guardando.
        + YOU: Ehm, salve!
            UgoEMimi: Salve, io sono Ugo, e lei è mia moglie Mimi. Mia.
        + YOU: Anche voi siete qui contro la vostra volontà?
            UgoEMimi: Beh, mio marito...
            UgoEMimi: Mimi è timida ma sì, siamo qui perché lo vogliamo.
        + YOU: Bel taglio di capelli, signora!
            UgoEMimi: Merito mio, ho scelto io la sua parrucchiera, da bravo marito!
        -
    UgoEMimi: E tu, cosa ci fai qui?
    UgoEMimi: Ugo, non essere scortese, siamo tutte tese da questa novità!
        + YOU: Me lo chiedo anche io.
        + YOU: Credo sia una punizione da parte del Culto.
        + YOU: Ricordo solo la mia stanza, del cloroformio...
        -
    UgoEMimi: Hai bisogno di una mano per cucinare, tesoro?
    UgoEMimi: Mimi! Che aiuti la concorrenza? Mi servono i soldi per il publisher!
    UgoEMimi: Ugo, ma non è che voglio dire a questa persona che per un aspic perfetto il segreto è la migliore <b>colla di pesce</b> e <b>filtrarla</b> con delicatezza.
        ~ dialogue_ingredients_of_the_day += colladipesce
        ~ dialogue_ingredients_of_the_day += filtrare
        + YOU: La ringrazio signora, ma gli anni'80 sono finiti da quel dì!
        + YOU: Non mangio un aspic dal giorno in cui hanno sacrificato nonna a Adramelech per la mia iniziazione, quanti ricordi!
        + YOU: Signora, se ha bisogno di aiuto batta le ciglia due volte.
            YOU: Con questa luce non si capisce un cazzo. Riprovi!
        -
    UgoEMimi: Mimi, andiamocene! Credo di aver visto una tizia con un iPod, forse è un audio designer!    
        
        
        -> loop
    
    = BeBe_choice
    //Ingredienti suggeriti: cipolla e affettare
    ~ loungeDialogue(BeBe)
    BeBe: Eppure ero sicura di averli messi qui, acciderbolina!
        + YOU: Hai perso qualcosa?
        -
    BeBe: I miei occhiali da sole! Non mi piace andare in giro senza.
        + YOU: Li hai addosso, sai?
            BeBe: Uh, che distratta che sono! Sai, avere otto, ehm, sette figlie rende tutto difficile.
        + YOU: Ma non c'è il sole qui. Forse manco su tutto il pianeta.
            BeBe: Però c'è dell'erba, ne sento l'odore!
        + YOU: Mmm sì sì certo.
            BeBe: Stai citando quel nuovo gruppo K-Pop, le Blink of an eye?
        -
    BeBe: Ma come ti stai trovando qui, dolcezza? Hai tutto quello di cui hai bisogno?
        + YOU: Non so dove sono, vorrei solo scappare.
            BeBe: Se vinco, ti prometto che ti porterò con me, ho ancora una cameretta libera!
        + YOU: L'ultima volta che ho cucinato, la mia casa è esplosa.
            BeBe: Succede a tutte le persone, prima o poi.
        + YOU: Non dovrei essere qui. Il Culto mi sta cercando.
            BeBe: Culto?
        -
        + YOU: Piuttosto, cosa hai deciso di cucinare per la prima puntata?
        -
    BeBe: Uh sai, pur essendo una pecora in carriera, essere una madre single di otto, uffa, sette agnelline ti obbliga a fare i conti coi soldi.
    BeBe: Per cui penso preparerò della zuppa di pane e <b>cipolla</b> da <b>affettare</b>.
    BeBe: La cipolla rende tutto buonissimo, e non costa niente.
    ~ dialogue_ingredients_of_the_day += cipolla
    ~ dialogue_ingredients_of_the_day += affettare
        + YOU: Uh, ora capisco l'alito.
        + YOU: Io son più persona da snack, sai?
        + YOU: Grazie del consiglio.
        -
    BeBe: Comunque non mi sono presentata! Sono Bebe. Ora vado a prepararmi per la fase di cucina, spero di ritrovarti presto!
        + YOU: Buona fortuna.
        + YOU: Ti batterò.
        + YOU: Come si esce da qui?!?!?
        -
        -> loop
    
    = Piiiietro_choice
    ~ loungeDialogue(Piiiietro)
    //Ingredienti suggeriti: tonno in scatola e mescolare
    Piiiietro: Bruiser Woods! Dove sei finito? Cristo, ti sei portato via anche il mio rosario di Gucci!
    Piiiietro: L'avevo detto a Snooki, oh se gliel'avevo detto, che era una pessima idea, ma lei no, no! Bruiser!
        + YOU: Bruiser Woods?
            Piiiietro: Sì, come quel Bruiser, e non lo trovo!
        + YOU: Rosario di Gucci?
            Piiiietro: Sì, un regalo di mia nonna Scianel per festeggiare il mio sedicesimo.
        + YOU: Snookie?
            Piiiietro: Scusa, ho firmato un NDA, non posso dire altro.
        -
    Piiiietro: Tornerà, spero. Questo pianeta sembra minuscolo comunque, non ci saranno altre cagnoline.
    Piiiietro: Comunque piacere, sono Piiiietro, studentessa di matematica. A quattordici anni ho risolto il gioco di Collatz.
    Piiiietro: A quindici le equazioni di Navier-Stokes ma non ho ancora ricevuto la medaglia Fields perché dopo quella storia di Perel'man hanno paura di fare casini.
    Piiiietro: Ma tu non stai capendo una ceppa, vero?
        + YOU: In realtà Perel'man alle medie mi copiava.
        + YOU: Sto ancora pensando al rosario di Gucci.
        + YOU: No, ma settimana scorsa ho azzeccato al primo colpo il resto al supermercato.
        -
    Piiiietro: Che se non trovo il rosario mia nonna mi uccide, sai?
    Piiiietro: La famiglia tutta. Sono tutti così religiosi, pensa che hanno un santino di Paolo Brosio sul caminetto che sbatte gli occhi.
    Piiiietro: Mi hanno obbligata a studiare matematica per confermare l'esistenza di Dio.
        + YOU: E sei anche un'ottima cuoca, quindi?
        -
    Piiiietro: Cuoca? In che senso, cuoca?
        + YOU: Beh, questo è un programma di cucina, credo ci abbiano rapite etc etc.
        -
    Piiiietro: Non siamo ad Amici?!?
        + YOU: Dovremmo ballare su quell'enorme cucina a gas?
        + YOU: Cuccarini ha detto cose che manco un cane, ma non credo.
        + YOU: No grazie, preferisco il rapimento.
        -
    Piiiietro: Ma io so giusto cucinare un piatto di pasta col <b>tonno in scatola</b> e <b>mescolare</b>, cazzo ci faccio qui?
       ~ dialogue_ingredients_of_the_day += tonno_in_scatola
        ~ dialogue_ingredients_of_the_day += mescolare
    Piiiietro: Bruiser, Bruiser dove sei? Dobbiamo andarcene da qui! A dopo, o a mai più!
    
        -> loop
    
    = Quello_choice
    //Ingredienti suggeriti: burro e montare
    ~ loungeDialogue(Quello)
    Quello: Ma buongiorno splendore lunare! Non trovi che questo posto sia magnifico?
        + YOU: Ma tu sai come sei arrivato qui?
        + YOU: Credo di aver visto un cadavere prima dietro alla telecamera. E mi ha fatto l'occhiolino.
        + YOU: Sempre meglio della Chiesa del Culto, credo.
        -
    Quello: Sento un po' la pressione, sai? Tutta questa gente professionista, e io che sono solo un piccolo pasticcere, come mi ricorda sempre il Divo. Molto molto piccolo. Infimo quasi.
        + YOU: Il Divo?
            Quello: Sì, il mio capo, un uomo severo ma affettuoso a modo suo. Mi ha obbligato a venire qui, così se vinco i soldi vanno al suo ristorante.
        + YOU: Ti lasci dire queste cose?
            Quello: Ogni apprendista merita la lezione dell'umiltà, non trovi?
        + YOU: La cosa più complessa che ho cucinato è una caprese, e ci ho perso un dito.
            Quello: Il Divo dice che è importante lasciare sempre qualcosa di sé in ciò che cuciniamo, sai?
        -
    Quello: Comunque piacere, il mio nome è Quello. A volte Quello Lì, altre volte Quell'altro. Le persone sanno essere così creative.
    Quello: Come cercherai di stupire Dogron?
        + YOU: Non ferendo nessuno.
        + YOU: Fuggendo mentre tutte voi cucinate.
        + YOU: Uova al tegamino?
        -
    Quello: Woah, tu hai le idee chiarissime! Io volevo puntare su delle meringhe, ma il Divo l'ultima volta le ha definite troppo meringose, e non va bene. Capisce cosa è giusto in un colpo d'occhio!
    Quello: So solo fare dolci, e allora pensavo di prendere del <b>burro</b> e un po' di altre cose, <b>montare</b> con pazienza a mano tutto e fare dei semplici baci di Dama.
    ~ dialogue_ingredients_of_the_day += burro
    ~ dialogue_ingredients_of_the_day += montare
        + YOU: Semplici. Certo.
        -
    Quello: Ora vado a pulire le unghie de il Divo, che poverino da solo non riesce. A dopo, è stato bello parlarti. Parlare.    
        
     
        -> loop
    
    = ilDivo_choice
    ~ loungeDialogue(ilDivo)
    //Ingredienti suggeriti: zafferanno e mantecare
    ilDivo: No no, niente Oprah per me, non mi abbasso certo al suo livello!
    ilDivo: Ehi, ehi tu!
        + YOU: Dici a me?
        -
    ilDivo: Sì, a te, mica c'è altra gente in giro. Ah no, sì, ero al telefono con la segretaria. Di nuovo! Che ce l'hai un po' di <b>zafferano</b>?
    ~ dialogue_ingredients_of_the_day += zafferano
        + YOU: Sento un attimo lo spaccino e ti dico.
            ilDivo: Ok, senti se ha anche della bamba allora.
        + YOU: Per questo sei tutto giallo?
            ilDivo: Guarda che son rosso. Te li ha insegnati Dogron, i colori?
        + YOU: Tu hai idea di dove siamo, piuttosto?
            ilDivo: Stagista inutile. Sempre inutili, cristo!
        -
    ilDivo: No no, non parlavo con te. Oh, madonna, ascolta, ci sentiamo dopo. E vedi di fare quelle tre ore di straordinario non pagato per cui siamo d'accordo, va bene?!?!
    ilDivo: E pulisci la cucina, non mi importa che il ristorante sia chiuso.
    ilDivo: Eccomi, ovviamente ti starai chiedendo cosa ci faccio qui.
        + YOU: Dici a me?
        -
    ilDivo: E a chi sennò, bauscia?!? Vuoi un autografo, immagino?
    ilDivo: O il mio segreto per <b>mantecare</b> il risotto ala milanese?
    ~ dialogue_ingredients_of_the_day += mantecare 
    ilDivo: Che sei single?
    ilDivo: Ah, ma non mi far perdere tempo. Cercami Quello, e portami un paio di etti di caviale e coca per la merendina del campione.
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

    ~ moveToLounge()

{ 
- not success && not ScampataLaMorte && abilities has SaltaMorte:
  ~ ScampataLaMorte = true
  ~ abilities -= SaltaMorte
  DOGRON: Uh, ma una persona qui ha usato la possibilità di scampare la morte, anche se ha perso! Fortunata questa persona casuale, sì sì!
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

-> passaggio_lounge_giorno_due