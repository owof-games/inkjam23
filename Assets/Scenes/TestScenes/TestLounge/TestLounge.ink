LIST ingredients = uova, pentola, noce_moscata, farina, saltare, sciogliere, lievitare, sale, cipolla, affettare, tonno_in_scatola, mescolare, burro, montare, zafferano, mantecare, braciola, arrosticino, costina, osso, grigliare, crocchette, versare, riempire, formaggio, fondere, coccole, brandina, cuccia, sgranocchiare, fidarsi, barattoloDelloYogurt, pettorina, trasportino, veterinario, automobile, viaggiare, inconscio, correreneisogni, coccolare, carezzare, pettare, grattare, dormireAssieme, protezione, noGatti, volAuVent, Skyrim, blocchiDiErba, uovaDiPecora, scolare, lacrime, cacaoAmaro, specchiarsi, scottare, iverivideogiochi, canapé, mungere, cardare, ChinottoDiSavona, raccontare, selfie, interviste, avvelenare, collareconetichetta, tonnoalnaturale, cantare, perdonare, evolversi, iomestessomemedesimo, selfcare, sventrare, emancipazione, MichelaMurgia, sacrificio, Peanutbutter, collarePreferito, KateBush, ideaDiSuccesso, cassaPortatile, padre, funghicida, mappa, grande, aiuto, aiutoooooo

VAR base_ingredients_of_the_day = ()
VAR dialogue_ingredients_of_the_day = ()
VAR success = true

LIST characters = BeBe, UgoEMimi, Piiietro, Quello, IlDivo
LIST extra_characters = DOGRON

LIST abilities = EvidenziaIngredienti, ScelteLente, (SceltaIngrediente), PNGParliExtra, SaltaMorte, EliminaConcorrente, RichiamaConcorrente

-> passaggio_kitchen
    
=== passaggio_kitchen

~ moveToKitchen()

    ~ base_ingredients_of_the_day = (uova, farina, saltare, sciogliere, lievitare, sale)
    ~ dialogue_ingredients_of_the_day += arrosticino
    ~ dialogue_ingredients_of_the_day += cipolla

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

-> passaggio_lounge_giorno_due

= non_ce_lhai_fatta
~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: è un peccato che tu non ce l'abbia fatta!
-> END

= finale_uno
~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: questo è il finale uno
->->

= finale_due
~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: questo è il finale due
->->

= finale_tre
~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: questo è il finale tre
->->

= finale_quattro
~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: questo è il finale quattro
->->

= finale_cinque
~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: questo è il finale cinque
->->

= passaggio_lounge_giorno_due

~ moveToLounge()
~ loungeDialogue(DOGRON)
DOGRON: e ora passiamo al giorno due
-> END

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
    - collarePreferito: il collare preferito di DOGRON
    - KateBush: Kate Bush
    - ideaDiSuccesso: l'idea del successo
    - cassaPortatile: una cassa portatile
    - padre: padre
    - funghicida: funghicida
    - mappa: mappa
    - grande: Io sono ancora grande, è la ristorazione che è diventata piccola.
    - aiuto: aiuto
    - aiutoooooo: AIUTOOOOOOOOOOOOOOOOOOOO

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
    - collarePreferito: 4
    - KateBush: 3
    - ideaDiSuccesso: 4
    - cassaPortatile: 4
    - padre: 3
    - funghicida: 4
    - mappa: 4
    - grande: 2
    - aiuto: 3
    - aiutoooooo: 4
    }















=== passaggio_lounge

~ moveToLounge()

~ temp num_loop_rimanenti = 3

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
    * {num_loop_rimanenti >= 0} [@IlDivo]
      -> IlDivo_choice  
  
    * -> cucina_giorno_uno
  
    = UgoEMimi_choice
    //Ingredienti suggeriti: colla di pesce e frullare
        ~ loungeDialogue(UgoEMimi)
        YOU: ciao
        UgoEMimi: ciao a te!
        UgoEMimi: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
        ~ dialogue_ingredients_of_the_day += uova
        -> loop
    
    = BeBe_choice
    //Ingredienti suggeriti: cipolla e affettare
        ~ loungeDialogue(BeBe)
        BeBe: <b>ciao</b>
        YOU: ciao
        BeBe: dimmi qualcosa
        * YOU: qualcosa
        BeBe: molto divertente
        -> loop
    
    = Piiiietro_choice
    //Ingredienti suggeriti: tonno in scatola e mescolare
        ~ loungeDialogue(Piiietro)
        Piiiietro: ciao
        YOU: ciao
        -> loop
    
    = Quello_choice
    //Ingredienti suggeriti: burro e montare
        ~ loungeDialogue(Quello)
        Quello: ciao
        YOU: ciao
        -> loop
    
    = IlDivo_choice
    //Ingredienti suggeriti: zafferanno e mantecare
        ~ loungeDialogue(IlDivo)
        IlDivo: ciao
        YOU: ciao
    -> loop

    = cucina_giorno_uno
    -> END

EXTERNAL moveToLounge()
=== function moveToLounge() ===
[[[move to lounge]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen]]]

EXTERNAL loungeDialogue(char)
=== function loungeDialogue(char) ===
[[[talk with {char}]]]