// lista di tutte le RichiamaConcorrenteilità possibili, verrà popolata durante il primo dialogo
LIST abilities = EvidenziaIngredienti, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte, EliminaConcorrente, RichiamaConcorrente
// lista dei personaggi in vita, all'inizio dovranno essere selezionati tutti
LIST alive_characters = (UgoEMimi), (BeBe), (Piiiietro), (Quello), (ilDivo)
LIST extra_characters = DOGRON

// lista di tutti gli ingredienti possibili di tutte le giornate
LIST ingredients = uova, pentola, noce_moscata, farina, saltare, sciogliere, lievitare, sale, cipolla, affettare, tonno_in_scatola, mescolare, burro, montare, zafferano, mantecare, braciola, arrosticino, costina, osso, grigliare, crocchette, versare, riempire, formaggio, fondere, coccole, brandina, cuccia, sgranocchiare, fidarsi, barattoloDelloYogurt, pettorina, trasportino, veterinario, automobile, viaggiare, inconscio, correreneisogni, coccolare, carezzare, pettare, grattare, dormireAssieme, protezione, noGatti, volAuVent, Skyrim, blocchiDiErba, uovaDiPecora, scolare, lacrime, cacaoAmaro, specchiarsi, scottare, iverivideogiochi, canapé, mungere, cardare, ChinottoDiSavona, raccontare, selfie, interviste, avvelenare, collareconetichetta, tonnoalnaturale, cantare, perdonare, evolversi, iomestessomemedesimo, selfcare, sventrare, emancipazione, MichelaMurgia, sacrificio, Peanutbutter, giocattoloPreferito, KateBush, ideaDiSuccesso, cassaPortatile, padre, funghicida, mappa, grande, aiuto, aiutoooooo, colladipesce, filtrare, Mazinga, orecchieUgo

// variRichiamaConcorrenteile che tiene gli ingredienti che appaiono nella roulette russa per il giorno che stiamo giocando
VAR base_ingredients_of_the_day = ()
VAR dialogue_ingredients_of_the_day = ()

// viene impostata da unity alla fine della ricetta e ti dice se ce l'hai fatta o meno
VAR success = true

VAR Eliminatrice = false
VAR Resuscitatrice = false
VAR ScampataLaMorte = false


=== function translate_ingredient(ingredient) ===
    { ingredient:
    - uova: uova
    - pentola: pentola
    - noce_moscata: noce moscata
    - farina: farina
    - saltare: saltare
    - sciogliere: sciogliere
    - lievitare: lievitare
    - sale: sale
    - cipolla: cipolla
    - affettare: affettare
    - tonno_in_scatola: tonno in scatola
    - mescolare: mescolare
    - burro: burro
    - montare: montare
    - zafferano: zafferano
    - mantecare: mantecare
    - braciola: braciola
    - arrosticino: arrosticino
    - costina: costina
    - osso: osso
    - grigliare: grigliare
    - crocchette: crocchette
    - versare: versare
    - riempire: riempire
    - formaggio: formaggio
    - fondere: fondere
    - coccole: coccole
    - brandina: brandina
    - cuccia: cuccia
    - sgranocchiare: sgranocchiare
    - fidarsi: fidarsi
    - barattoloDelloYogurt: il barattolo dello Yogurt
    - pettorina: pettorina
    - trasportino: trasportino
    - veterinario: veterinario
    - automobile: automobile
    - viaggiare: viaggiare
    - inconscio: inconscio
    - correreneisogni: correre nei sogni
    - coccolare: coccolare
    - carezzare: carezzare
    - pettare: pettare
    - grattare: grattare
    - dormireAssieme: dormire assieme
    - protezione: protezione
    - noGatti: niente gatti!
    - volAuVent: vol-au-vent
    - Skyrim: Skyrim
    - blocchiDiErba: blocchi di erba
    - uovaDiPecora: uova di pecora
    - scolare: scolare
    - lacrime: lacrime
    - cacaoAmaro: cacao amaro
    - specchiarsi: specchiarsi
    - scottare: scottare
    - iverivideogiochi: i VERI videogiochi
    - canapé: canapé
    - mungere: mungere
    - cardare: cardare
    - ChinottoDiSavona: Chinotto di Savona
    - raccontare: raccontare
    - selfie: selfie
    - interviste: interviste
    - avvelenare: avvelenare
    - collareconetichetta: collare con un'etichetta col nome Dogron
    - tonnoalnaturale: tonno in scatola al naturale
    - cantare: cantare
    - perdonare: perdonare
    - evolversi: evolversi
    - iomestessomemedesimo: iomestessomemedesimo
    - selfcare: hashtagselfcare
    - sventrare: sventrare
    - emancipazione: emancipazione
    - MichelaMurgia: Michela Murgia
    - sacrificio: sacrificio
    - Peanutbutter: mr.Peanutbutter
    - giocattoloPreferito: la pallina preferita di DOGRON
    - KateBush: Kate Bush
    - ideaDiSuccesso: l'idea del successo
    - cassaPortatile: una cassa portatile
    - padre: padre
    - funghicida: funghicida
    - mappa: mappa
    - grande: Io sono ancora grande, è la ristorazione che è diventata piccola.
    - aiuto: aiuto
    - aiutoooooo: AIUTOOOOOOOOOOOOOOOOOOOO
    - colladipesce: colla di pesce
    - filtrare: filtrare
    - Mazinga: Mazinga
    - orecchieUgo: orecchie di Ugo

    }

=== function value_ingredient(ingredient) ===
    { ingredient:
    - uova: 1
    - pentola: 2
    - noce_moscata: 1
    - farina: 1
    - saltare: 1
    - sciogliere: 2
    - lievitare: 2
    - sale: 1
    - cipolla: 1
    - affettare: 3
    - tonno_in_scatola: 1
    - mescolare: 1
    - burro: 1
    - montare: 3
    - zafferano: 3
    - mantecare: 3
    - braciola: 2
    - arrosticino: 3
    - costina: 3
    - osso: 2
    - grigliare: 2
    - crocchette: 1
    - versare: 2
    - riempire: 3
    - formaggio: 2
    - fondere: 2
    - coccole: 3
    - brandina: 3
    - cuccia: 3
    - sgranocchiare: 2
    - fidarsi: 3
    - barattoloDelloYogurt: 2
    - pettorina: 3
    - trasportino: 3
    - veterinario: 3
    - automobile: 3
    - viaggiare: 2
    - inconscio: 3
    - correreneisogni: 2
    - coccolare: 3
    - carezzare: 2
    - pettare: 3
    - grattare: 4
    - dormireAssieme: 4
    - protezione: 2
    - noGatti: 4
    - volAuVent: 2
    - Skyrim: 2
    - blocchiDiErba: 2
    - uovaDiPecora: 3
    - scolare: 2
    - lacrime: 3
    - cacaoAmaro: 2
    - specchiarsi: 3
    - scottare: 2
    - iverivideogiochi: 3
    - canapé: 2
    - mungere: 2
    - cardare: 3
    - ChinottoDiSavona: 2
    - raccontare: 3
    - selfie: 3
    - interviste: 3
    - avvelenare: 3
    - collareconetichetta: 3
    - tonnoalnaturale: 3
    - cantare: 3
    - perdonare: 3
    - evolversi: 3
    - iomestessomemedesimo: 3
    - selfcare: 3
    - sventrare: 3
    - emancipazione: 4
    - MichelaMurgia: 4
    - sacrificio: 3
    - Peanutbutter: 4
    - giocattoloPreferito: 4
    - KateBush: 3
    - ideaDiSuccesso: 4
    - cassaPortatile: 4
    - padre: 3
    - funghicida: 4
    - mappa: 4
    - grande: 2
    - aiuto: 3
    - aiutoooooo: 4
    - colladipesce: 1
    - filtrare: 1
    - Mazinga: 2
    - orecchieUgo: 3
    }



=== function remove_random_ability() ===

    ~ abilities = (EvidenziaIngredienti, ScelteLente, SceltaIngrediente, PNGParliExtra, SaltaMorte)
    
    ~ temp value = RANDOM(1, 8)
    ~ temp ability = abilities(value)
    ~ abilities -= ability
    
    Rimossa {ability}.




=== inizio_lounge ===

    ~ moveToLounge()
    
    DOGRON: Ed ora, nostra persona concorrente preferita insieme a tutte le altre, ti ricordo che:
    DOGRON: Ogni giorno perderai una delle tue abilità. Quelle che perdi oggi sono:
    ~ temp ability = LIST_RANDOM(abilities)
    { ability:
      - EvidenziaIngredienti: DOGRON: Non potrai più vedere in modo chiaro gli ingredienti.
      - ScelteLente: DOGRON: Le scelte ora scorreranno più veloci. 
      - SceltaIngrediente: DOGRON: Non avrai più un ingrediente a scelta da selezionare a inizio partita.
      - PNGParliExtra: DOGRON: Basta con le chiacchiere extra!
      - SaltaMorte: DOGRON: Se sbagli la ricetta, non avrai più piani di salvataggio.
      - EliminaConcorrente: DOGRON: Non potrai più eliminare un'altra persona concorrente.
      - RichiamaConcorrente: DOGRON: Niente potere di richiamare una persona che se ne è andata.
    }
    
    ~ abilities -= ability
    
    { abilities has PNGParliExtra:
      DOGRON: Ti ricordo cara persona che potrai parlare con una persona in più.
    }
    { abilities has EliminaConcorrente and not Eliminatrice:
        -> Eliminatrice_choice ->
    }
        { abilities has RichiamaConcorrente and not Resuscitatrice:
        -> Resuscitatrice_choice ->
    }

    ->->

    = Eliminatrice_choice
        // TODO: visualizzare solo se ci sono almeno 2 persone vive
        DOGRON: Hai la possibilità di eliminare una di queste belle persone, di chi ti vuoi liberare?
            + {alive_characters has BeBe} YOU:BeBe.
                ~ alive_characters -= BeBe
                DOGRON: Bebe, per te Miss Italia finisce qui!
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
            + {alive_characters has Piiiietro} YOU:Piiiietro.
                ~ alive_characters -= Piiiietro
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
                DOGRON: Piiiietro, il mio numero preferito: sei stato eliminato!
            + {alive_characters has UgoEMimi} YOU:Ugo e Mimi.
                ~ alive_characters -= UgoEMimi
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
                DOGRON: Mimi, sashay away.
            + {alive_characters has Quello} YOU:Quello.
                ~ alive_characters -= Quello
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
                DOGRON: Oh. Oh. Amico mio, spero perdonerai questa persona concorrente, ma dovrai andartene. Ci rivedremo nel prato infinito!
            + {alive_characters has ilDivo} YOU:Il divo.
                ~ alive_characters -= ilDivo
                ~ Eliminatrice = true 
                ~ abilities -= EliminaConcorrente
                DOGRON: spiace, circa. Addio Divo!
            + YOU: Nessuna persona!
                DOGRON: Mi piace questo modo di ragionare!
            -
        ->->
    
    = Resuscitatrice_choice
        // TODO: visualizzare solo se c'è almeno una persona che è uscita
        DOGRON: Vuoi riportare una persona concorrente tra noi?
            + { alive_characters hasnt BeBe } YOU:BeBe!
            ~ alive_characters += BeBe
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON:Bentornata BeBe!
            + { alive_characters hasnt Piiiietro } YOU:Piiiietro!
            ~ alive_characters += Piiiietro
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Ed ecco a voi di nuovo: Piiiietro!
            + { alive_characters hasnt UgoEMimi } YOU: Ugo e Mimi!
            ~ alive_characters += UgoEMimi
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Mimììì! Che bello averti qui con noi di nuovo!
            + { alive_characters hasnt Quello } YOU: Quello.
            ~ alive_characters += Quello
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Ma ciao amico mio, finalmente!
            + { alive_characters hasnt ilDivo } YOU: Il Divo.
            ~ alive_characters += ilDivo
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Toh, è tornato!
            + YOU: MMM, sto bene così, grazie.
                DOGRON: Ah, uuuuh, mi sembra crudele ma il gioco è questo, no?
            -
        ->->





== EliminazioneConcorrente

~ temp da_eliminare = LIST_RANDOM(alive_characters)
DOGRON: Complimenti, hai vinto a scapito di: {da_eliminare}
~ alive_characters -= da_eliminare
->->






EXTERNAL moveToLounge()
=== function moveToLounge() ===
[[[move to lounge]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen]]]

EXTERNAL loungeDialogue(char)
=== function loungeDialogue(char) ===
[[[talk with {char}]]]
