LIST ingredients = uova, pentola, noce_moscata, farina, saltare, sciogliere, lievitare, sale, cipolla, affettare, tonno_in_scatola, mescolare, burro, montare, zafferano, mantecare, braciola, arrosticino, costina, osso, grigliare, crocchette, versare, riempire, formaggio, fondere, coccole, brandina, cuccia, sgranocchiare, fidarsi, barattoloDelloYogurt, pettorina, trasportino, veterinario, automobile, viaggiare, inconscio, correreneisogni, coccolare, carezzare, pettare, grattare, dormireAssieme, protezione, noGatti, volAuVent, Skyrim, blocchiDiErba, uovaDiPecora, scolare, lacrime, cacaoAmaro, specchiarsi, scottare, iverivideogiochi, canapé, mungere, cardare, ChinottoDiSavona, raccontare, selfie, interviste, avvelenare, collareconetichetta, tonnoalnaturale, cantare, perdonare, evolversi, iomestessomemedesimo, selfcare, sventrare, emancipazione, MichelaMurgia, sacrificio, Peanutbutter, collarePreferito, KateBush, ideaDiSuccesso, cassaPortatile, padre, funghicida, mappa, grande, aiuto, aiutoooooo

VAR base_ingredients_of_the_day = ()
VAR dialogue_ingredients_of_the_day = ()
VAR success = true


-> passaggio_kitchen
    
=== passaggio_kitchen

~ moveToKitchen()

    ~ base_ingredients_of_the_day = (uova, farina, saltare, sciogliere, lievitare, sale)

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
DOGRON: è un peccato che tu non ce l'abbia fatta!
-> END

= finale_uno
~ moveToLounge()
DOGRON: questo è il finale uno
->->

= finale_due
~ moveToLounge()
DOGRON: questo è il finale due
->->

= finale_tre
~ moveToLounge()
DOGRON: questo è il finale tre
->->

= finale_quattro
~ moveToLounge()
DOGRON: questo è il finale quattro
->->

= finale_cinque
~ moveToLounge()
DOGRON: questo è il finale cinque
->->

= passaggio_lounge_giorno_due

~ moveToLounge()
DOGRON: e ora passiamo al giorno due
-> END
















=== passaggio_lounge

~ moveToLounge()

~ temp num_loop_rimanenti = 3

- (loop)
~ num_loop_rimanenti -= 1

$
* {num_loop_rimanenti >= 0} [@pippo]
  -> pippo_choice
* {num_loop_rimanenti >= 0} [@pluto]
  -> pluto_choice
* {num_loop_rimanenti >= 0} [@paperino]
  -> paperino_choice
* {num_loop_rimanenti >= 0} [@tre]
  -> tre_choice
* {num_loop_rimanenti >= 0} [@quattro]
  -> quattro_choice
* {num_loop_rimanenti >= 0} [@cinque]
  -> cinque_choice
* -> fine
  

= pippo_choice
you: ciao
pippo: sono pippo!
pippo: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
+ you: seriamente?
+ you: se lo dici tu
+ you: lo farò di sicuro
-
pippo: ottimo.
-> loop

= pluto_choice
you: ciao
pluto: sono pluto!
pluto: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
-> loop

= paperino_choice
you: ciao
paperino: sono paperino!
paperino: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
-> loop

= tre_choice
you: ciao
tre: sono tre!
tre: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
-> loop

= quattro_choice
you: ciao
quattro: sono quattro!
quattro: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
-> loop

= cinque_choice
you: ciao
cinque: sono cinque!
cinque: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
-> loop

= fine
~ moveToKitchen()
-> END


EXTERNAL moveToLounge()
=== function moveToLounge() ===
[[[move to lounge]]]

EXTERNAL moveToKitchen()
=== function moveToKitchen() ===
[[[move to kitchen]]]