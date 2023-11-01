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
    - uova: eggs
    - pentola: pot
    - noce_moscata: nutmeg
    - farina: flour
    - saltare: stir-frying
    - sciogliere: melt
    - lievitare: leavening
    - sale: salt
    - cipolla: onion
    - affettare: slicing
    - tonno_in_scatola: canned tuna
    - mescolare: stirring
    - burro: butter
    - montare: whipping
    - zafferano: saffron
    - mantecare: sauteing
    - braciola: pork chop
    - arrosticino: lamb vindaloo
    - costina: pork rib
    - osso: bone
    - grigliare: grilling
    - crocchette: kibbles
    - versare: pouring
    - riempire: filling
    - formaggio: cheese
    - fondere: melting
    - coccole: cuddles
    - brandina: cot
    - cuccia: kennel
    - sgranocchiare: crunching
    - fidarsi: trusting
    - barattoloDelloYogurt: the yoghurt pot
    - pettorina: harness
    - trasportino: pet carrier
    - veterinario: veterinarian
    - automobile: car
    - viaggiare: travel
    - inconscio: subconscious
    - correreneisogni: running in dreams
    - coccolare: cuddling
    - carezzare: caressing
    - pettare: fondling a dog
    - grattare: scratching
    - dormireAssieme: sleeping together
    - protezione: protection
    - noGatti: no cats allowed!
    - volAuVent: vol-au-vent
    - Skyrim: Skyrim
    - blocchiDiErba: blocks of grass
    - uovaDiPecora: sheep eggs
    - scolare: draining
    - lacrime: tears
    - cacaoAmaro: bitter cocoa
    - specchiarsi: mirroring
    - scottare: blanching
    - iverivideogiochi: the REAL video games
    - canapé: canapé
    - mungere: milking
    - cardare: carding
    - ChinottoDiSavona: Savona's Chinotto
    - raccontare: telling
    - selfie: selfie
    - interviste: interviews
    - avvelenare: poisoning
    - collareconetichetta: collar with a Dogron name tag
    - tonnoalnaturale: canned tuna au naturel
    - cantare: singing
    - perdonare: forgiving
    - evolversi: evolving
    - iomestessomemedesimo: memyselfandI
    - selfcare: hashtagselfcare
    - sventrare: gutting
    - emancipazione: empowerment
    - MichelaMurgia: Virginia Woolf
    - sacrificio: sacrifice
    - Peanutbutter: mr.Peanutbutter
    - giocattoloPreferito: the DOGRON's favourite ball
    - KateBush: Kate Bush
    - ideaDiSuccesso: the platonic idea of success
    - cassaPortatile: a portable loudspeaker
    - padre: father
    - funghicida: fungicide
    - mappa: map
    - grande: I am still big, it is the catering industry that has become small.
    - aiuto: help
    - aiutoooooo: HEEEEEEEEEEEEEEEEELP!
    - colladipesce: isinglass
    - filtrare: filtering
    - Mazinga: Great Mazinger
    - orecchieUgo: Ugo's ears

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
    
    Removed {ability}.




=== inizio_lounge ===

    ~ moveToLounge()
    
    DOGRON: {E ora, un benvenuuuuto a tuuuutte le persone concorrenti e a chi ci segue da casa!|Eccoci nuovamente, concorrenti e spettatrici!|Buonasera a tuuuuutte le persone belle di questo pianeta e oltre!|Qualcuuuuuna ha visto il mio collare preferito?|L'ultima sera amiche, l'uuuultima sera assieme!}
    DOGRON: {Concorrenti, ricordatevi che ogni giorno perderete una delle vostre abilità.  Persona uuuuumana qui davanti a me! Tu oggi perderai, rullo di tamburi...| Quuuuale abilità toglieremo oggi alla nostra persona umana?!?|Sempre meno gente, sempre meno abilità attive!|Uuuuh, mi fa male il pancino oggi.|Me doggo grande, non piange, no no, auuuuu!}
    ~ temp ability = LIST_RANDOM(abilities)
    { ability:
      - EvidenziaIngredienti: DOGRON: You will no longer be able to see the ingredients clearly.
      - ScelteLente: DOGRON: Choices will now flow faster. 
      - SceltaIngrediente: DOGRON: You no longer have an ingredient of your choice to select at the startof the game.
      - PNGParliExtra: DOGRON: Enough with the extra chatter!
      - SaltaMorte: DOGRON: If you get the recipe wrong, you won't have any rescue plans.
      - EliminaConcorrente: DOGRON: You will no longer be able to eliminate another competitor.
      - RichiamaConcorrente: DOGRON: No power to recall a person who has left.
    }
    
    ~ abilities -= ability
    
    { abilities has PNGParliExtra:
      DOGRON: I remind you dear person that you will be able to talk to one moreperson.
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
        DOGRON: You have a chance to get rid of one of these beautiful people, who doyou want to get rid of?
            + {alive_characters has BeBe} YOU:BeBe
                ~ alive_characters -= BeBe
                DOGRON: Bye Bye BeBe.
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
            + {alive_characters has Piiiietro} YOU:Piiiietro
                ~ alive_characters -= Piiiietro
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
                DOGRON: Piiiietro, my favourite number: you've been eliminated!
            + {alive_characters has UgoEMimi} YOU:Ugo e Mimi
                ~ alive_characters -= UgoEMimi
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
                Mimi, sashay away.
            + {alive_characters has Quello} YOU:Quello
                ~ alive_characters -= Quello
                ~ Eliminatrice = true
                ~ abilities -= EliminaConcorrente
                DOGRON: Oh. Oh. My friend, I hope you will forgive this competitor, but you mustleave. I will see you again in the endless meadow!
            + {alive_characters has ilDivo} YOU:Il divo
                ~ alive_characters -= ilDivo
                ~ Eliminatrice = true 
                ~ abilities -= EliminaConcorrente
                DOGRON: sorry, sort of. Goodbye, Divo!
            + YOU: No person!
                DOGRON: I like this way of reasoning!
            -
        ->->
    
    = Resuscitatrice_choice
        // TODO: visualizzare solo se c'è almeno una persona che è uscita
        DOGRON: You want to bring a competitor back among us?
            + { alive_characters hasnt BeBe } YOU:BeBe!
            ~ alive_characters += BeBe
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Welcome baaaaaack, BeBe!
            + { alive_characters hasnt Piiiietro } YOU:Piiiietro!
            ~ alive_characters += Piiiietro
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: And here you go again: Piiiietro!
            + { alive_characters hasnt UgoEMimi } YOU: Ugo & Mimi!
            ~ alive_characters += UgoEMimi
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Mimi! How nice to have you here with us again!
            + { alive_characters hasnt Quello } YOU: Quello
            ~ alive_characters += Quello
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Hello my friend, at last!
            + { alive_characters hasnt ilDivo } YOU: Il Divo
            ~ alive_characters += ilDivo
            ~ Resuscitatrice = true
            ~ abilities -= RichiamaConcorrente
            DOGRON: Well, he's back!
            + YOU: MMM, I'm fine, thank you.
                DOGRON: Ah, uh, it seems cruuuuuel but that's the game, isn't it?
            -
        ->->





== EliminazioneConcorrente

~ temp da_eliminare = LIST_RANDOM(alive_characters)
DOGRON: Congratulations, you won at the expense of: {da_eliminare}
~ alive_characters -= da_eliminare
->->






EXTERNAL moveToLounge()
=== function moveToLounge() ===
[[[move to lounge]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen]]]

EXTERNAL moveToEnd()
=== function moveToEnd() ===
[[[move to kitchen]]]

EXTERNAL loungeDialogue(char)
=== function loungeDialogue(char) ===
[[[talk with {char}]]]






VAR num_ingredients = 0
