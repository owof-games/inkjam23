// lista di tutte le RichiamaConcorrenteilità possibili, verrà popolata durante il primo dialogo
LIST abilities = EvidenziaIngredienti, EvidenziaAzioni, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte, EliminaConcorrente, RichiamaConcorrente
// lista dei personaggi in vita, all'inizio dovranno essere selezionati tutti
LIST alive_characters = (UgoEMimi), (BeBe), (Piiiietro), (Quello), (ilDivo)

// lista di tutti gli ingredienti possibili di tutte le giornate
LIST ingredients = uova, pentola, noce_moscata
// variRichiamaConcorrenteile che tiene gli ingredienti che appaiono nella roulette russa per il giorno che stiamo giocando
VAR base_ingredients_of_the_day = ()
VAR dialogue_ingredients_of_the_day = ()

// viene impostata da unity alla fine della ricetta e ti dice se ce l'hai fatta o meno
VAR success = true

VAR Eliminatrice = false
VAR Resuscitatrice = false



=== function translate_ingredient(ingredient) ===
{ ingredient:
- uova: uova
- pentola: pentola
- noce_moscata: noce moscata
}

=== function value_ingredient(ingredient) ===
{ ingredient:
- uova: 1
- pentola: 2
- noce_moscata: 1
}



=== function remove_random_ability() ===

~ abilities = (EvidenziaIngredienti, EvidenziaAzioni, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte)

~ temp value = RANDOM(1, 8)
~ temp ability = abilities(value)
~ abilities -= ability

Rimossa {ability}.




=== inizio_lounge ===

@lounge

DOGRON: eccoci con la nostra concorrente

DOGRON: Personcina bella, ti ricordo che ogni giorno perderai una delle tue abilità.
TODO: far levare solo le abilità che la giocatrice ha già.
~ temp value = RANDOM(1, 8)
~ temp ability = abilities(value)
{ ability:
  - EvidenziaIngredienti: DOGRON: Non potrai più vedere in modo chiaro gli ingredienti.
  - EvidenziaAzioni: DOGRON: Non potrai più vedere in modo chiaro le azioni.
  - ScelteLente: DOGRON: Le scelte ora scorreranno più veloci. 
  - SceltaIngrediente: DOGRON: Non avrai più un ingrediente a scelta da selezionare a inizio partita.
  - PNGParliExtra: DOGRON: Basta con le chiacchiere extra!
  - SaltaMorte: DOGRON: Se sbagli la ricetta, non avrai più piani di salvataggio.
  - EliminaConcorrente: DOGRON: Non potrai più eliminare un'altra persona concorrente.
  - RichiamaConcorrente: DOGRON: Niente potere di richiamare una persona che se ne è andata.
}

{ abilities has PNGParliExtra:
  DOGRON: Ti ricordo cara persona che potrai parlare con una persona in più.
}

~ abilities -= ability

{ abilities has EliminaConcorrente and not Eliminatrice:
    -> Eliminatrice_choice ->
}

{ abilities has RichiamaConcorrente and not Resuscitatrice:
    -> Resuscitatrice_choice ->
}

->->

= Eliminatrice_choice
DOGRON: Hai la possibilità di eliminare una di queste belle persone, di chi ti vuoi liberare?
* {alive_characters has BeBe} BeBe.
    ~ alive_characters -= BeBe
    DOGRON: Bebe, per te Miss Italia finisce qui!
    ~ Eliminatrice = true
* {alive_characters has Piiiietro} Piiiietro.
    ~ alive_characters -= Piiiietro
    ~ Eliminatrice = true
    DOGRON: Piiiietro, il mio numero preferito: sei stato eliminato!
* {alive_characters has UgoEMimi} Mimi.
    ~ alive_characters -= UgoEMimi
    ~ Eliminatrice = true
    DOGRON: Mimi, sashay away.
* {alive_characters has Quello} L'aspirapolvere.
    ~ alive_characters -= Quello
    ~ Eliminatrice = true
    DOGRON: Oh. Oh. Amico mio, spero perdonerai questa persona concorrente, ma dovrai andartene. Ci rivedremo nel prato infinito!
* {alive_characters has ilDivo} Il divo.
    ~ alive_characters -= ilDivo
    ~ Eliminatrice = true 
    DOGRON: spiace, circa. Addio Divo!
-

->->

= Resuscitatrice_choice
DOGRON: Vuoi riportare una persona concorrente tra noi?
    * { alive_characters hasnt BeBe } BeBe!
    ~ alive_characters += BeBe
    ~ Resuscitatrice = true
    DOGRON:Bentornata BeBe!
    * { alive_characters hasnt Piiiietro } Piiiietro!
    ~ alive_characters += Piiiietro
    ~ Resuscitatrice = true
    DOGRON: Ed ecco a voi di nuovo: Piiiietro!
    * { alive_characters hasnt UgoEMimi } Mimi!
    ~ alive_characters += UgoEMimi
    ~ Resuscitatrice = true
    DOGRON: Mimììì! Che bello averti qui con noi di nuovo!
    * { alive_characters hasnt Quello } L'aspirapolvere.
    ~ alive_characters += Quello
    ~ Resuscitatrice = true
    DOGRON: Ma ciao amico mio, finalmente!
    * { alive_characters hasnt ilDivo } Il divo.
    ~ alive_characters += ilDivo
    ~ Resuscitatrice = true
    DOGRON: Toh, è tornato!
-
TODO: aggiungere gli altri
->->







EXTERNAL moveToLounge()
=== function moveToLounge() ===
[[[move to lounge]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen]]]