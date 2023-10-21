-> passaggio_lounge

=== passaggio_lounge

~ moveToLounge()

~ temp num_loop_rimanenti = 2

- (loop)
~ num_loop_rimanenti -= 1

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
PAUSA
-> loop

= pluto_choice
you: ciao
pluto: sono pluto!
pluto: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
PAUSA
-> loop

= paperino_choice
you: ciao
paperino: sono paperino!
paperino: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
PAUSA
-> loop

= tre_choice
you: ciao
tre: sono tre!
tre: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
PAUSA
-> loop

= quattro_choice
you: ciao
quattro: sono quattro!
quattro: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
PAUSA
-> loop

= cinque_choice
you: ciao
cinque: sono cinque!
cinque: secondo me dovresti mettere delle <b>ciabatte</b> nella ricetta!
PAUSA
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