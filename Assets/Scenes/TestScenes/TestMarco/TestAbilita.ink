TODO: riduci a uno ingrediente
=== test_abilities
~ moveToLounge()
~ loungeDialogue(DOGRON)
// permette di aggiungere o togliere concorrenti a seconda che l'abilità sia disponibile.

//TEST: PRESENTAZIONE
DOGRON: Eccoci qui personcina umana! Sono suuuuperfelice che tu sia qui con me e i miei nuovi amici in questa stuuuuuuuuupenda avventura!
DOGRON: Affronterai cinque episodi di THE GOOD DOG SHOW e sono sicuuuuro che sarai la persona che vincerà! Lo sono sicuuuuro di tutte le persone in realtà!
DOGRON: E questo rende il programma difficile, forse.
DOGRON: Comunque: per conoscerci meglio vorrei farti qualche domanda, giusto per vedere come te la cavi in cucina, e capire che concorrente sarai. Iniziamo?

    + YOU: Certo!
    + YOU: Ho delle alternative?
        DOGRON: Ovviamente, ma poi ti perderesti tutto il divertimento!
    + YOU: Dove mi trovo? Cosa sta accadendo? Chi sei tu?
        DOGRON: No, aspetta, col test le domande te le faccio io persona amica!
    -    

//TEST: DOMANDA 1: abilità richiama Concorrente
- (domande)

{ shuffle stopping:
    - -> domanda1
    - -> domanda2
    - -> domanda3
    - -> domanda4
    - -> domanda5
    - -> domanda6
    - -> domanda7
    - -> domanda8
    - -> finedomande
}

= domanda1
DOGRON: Ti trovi su un pianeta sconosciuuuuto, hai fatto un grosso errore e non sai come tornare indietro. Che fai?
    + YOU: Provo a chiedere aiuto?
      ~ abilities += RichiamaConcorrente
    + YOU: Pianeta? No, seriamente, perché sono qui?
    + YOU: Mi siedo in un angolo a piangere.
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda2
// TEST: DOMANDA 2: abilità EvidenziaIngredienti
DOGRON: Tuuuutte le persone attorno a te parlano di colori, ma tuuuuu non hai capito che cosa sono. Come provi a capire qualcosa che non capisci per non farti scoprire?
    + YOU: Non saprei, ho smesso di studiare alla tabellina del tre.
    + YOU: Ma tutte queste luci? E perché la poltrona puzza di cane bagnato?
    + YOU: Copio le cose che fanno le altre persone, sperando di non fare cazzate.
      ~ abilities += EvidenziaIngredienti
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda3
// TEST: DOMANDA 3: abilità EvidenziaAzioni
DOGRON: Qualcosa con i baffi lunghi il pelo corto e l'abilità di infilarsi negli scatoloni ha distrutto il tuo gioco preferito. Come reagisci?
    + YOU: Distruggo tutto ciò che ha di più caro.
    + YOU: Ma che c'entra tutto questo con un concorso di cucina?
    + YOU: Strano, tutto questo mi ricorda Micia.
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda4
// TEST: DOMANDA 4: abilità ScelteLente
DOGRON: Qualcuuuuuuno a cui vuoi molto molto bene ti ha detto che sarebbe tornato suuubito, ma sono passati dieci minuti e ancora non si vede. Come affronti il luuuutto?
    + YOU: Ma siamo qui per farti terapia, o per un concorso?
    + YOU: Se non mi liberi subito chiamo il mio avvocato!
    + YOU: Direi che è il momento di dormire, chillarsi un poco, mettersi in pari con la lista di videogiochi in coda.
     ~ abilities += ScelteLente
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda5
// TEST: DOMANDA 5: abilità SceltaIngrediente
DOGRON: Qual è la tua pappa preferita, ma tipo la cosa suuuuuper preferita del mondo per te?
    + YOU: Gli arrosticini.
    + YOU: Ti prego fammi uscire da questo luogo, ti prego, cosa ti ho fatto di male?!?
    + YOU: La fine del capitalismo.
      ~ abilities += SceltaIngrediente
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda6
// TEST: DOMANDA 6: abilità PNGParliExtra
DOGRON: Ti portano al parco giochi. C'è il sole, un sacco di amici, e il tuo collare preferito.
    + YOU: Ma dov'è la domanda?
    + YOU: Questa è perfezione!
        ~ abilities += PNGParliExtra
    + YOU: Uh, che tipo di collare? Anche un harness?
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda7
// TEST: DOMANDA 7: abilità SaltaMorte
DOGRON: Sono giorni che ti fa male il pancino, tuuuuutto il pancino. Ti mettono il guinzaglio e fanno pat pat sul bagagliaio dell'automobile. Tu come reagisci?
    + YOU: Ti prego ti prego liberami non ho fatto niente, la mia pianta grassa sentirà la mancanza!
    + YOU: Sono una persona coraggiosa, andrò incontro al mio destino!
    ~ abilities += SaltaMorte
    + YOU: Col cazzo. Mordo la loro mano e fuggo verso la libertà!
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda8
// TEST: DOMANDA 8: abilità EliminaConcorrente
DOGRON: Hai seppellito qualcuno, ma non ti ricordi dove l'hai fatto, e sei molto triste, molto. Come reagisci?
    + YOU: Oh. Stai per uccidermi, vero?
        DOGRON: No no, ma che dici, mica sei un hotdog!
    + YOU: Nessun corpo, nessun crimine. Mi spiace, Ermenegildo.
        ~ abilities += EliminaConcorrente
    + YOU: Mi consegno alla polizia, spontaneamente. Non trovi sia la cosa più sensata da fare? La farai vero?
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= finedomande
- (loop)
{ LIST_COUNT(abilities) < 3:
    ~ temp value = RANDOM(1, 8)
    ~ temp ability = abilities(value)
    ~ abilities += ability
    -> loop
- else:
    DOGRON: Le domande sono finite! E grazie al nostro accuratissimo sistema psicologico approvato dal Gran Consiglio dei Carlini e dalla Suprema Chihuahua, io, Dogron III Ti assegno <>
    -> recap(LIST_VALUE(LIST_MIN(LIST_ALL(abilities))))
}

= recap(i)

~ temp ability = abilities(i)
{abilities has ability:
    
    {ability:
    - EvidenziaIngredienti: la capacità di notare subito gli ingredienti!
    - ScelteLente: la possibilità di rallentare il tempo.
    - SceltaIngrediente: la fortuna di poterti scegliere un ingrediente a inizio ricetta.
    - PNGParliExtra: il diritto di chiacchierare con una persona in più in lounge.
    - SaltaMorte: il, ehm, uh, lapossibilitàdisaltarelatuamorteunavolta uh guarda che bello un labrador!
    - EliminaConcorrente: il diritto di cacciare dal programma un'altra persona che è qui a conconcorrere. Conrerrere. Cha fai il concorso.
    - RichiamaConcorrente: il potere di richiamare una volta i morti. Woah!
    }
}
{i < LIST_VALUE(LIST_MAX(LIST_ALL(abilities))):
    -> recap(i+1)
}
-> passaggio_lounge_giorno_uno