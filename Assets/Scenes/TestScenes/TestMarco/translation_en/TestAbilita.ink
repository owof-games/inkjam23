TODO: riduci a uno ingrediente
=== test_abilities
~ moveToLounge()
~ loungeDialogue(DOGRON)
// permette di aggiungere o togliere concorrenti a seconda che l'abilità sia disponibile.

//TEST: PRESENTAZIONE
DOGRON: Here we are little human person! I am super glad you are here with me and my new friends on this wonderful adventure!
DOGRON: You will face five episodes of THE GOOOOOOOOOD DOG SHOW and I'm sure you will be the person who wins! I am sure of all the people actually!
DOGRON: And that makes the program difficult, perhaps.
DOGRON: Anyway: to get to know each other better, I'd like to ask you a few questions, just to see how you're doing in the kitchen, and figure out what kind of competitor you're going to be. Shall we start?

    + YOU: Sure!
    + YOU: Do I have any alternatives?
        DOGRON: Of course, but then you would miss all the fun!
    + YOU: Where am I? What is happening? Who are you?
        DOGRON: No, wait, with the test, I'll ask you the questions friend person!
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
DOGRON: You're on an unknowwwwn planet, you've made a big mistake, and you don't know how to get back. What do you do?
    + YOU: Do I try to ask for help?
      ~ abilities += RichiamaConcorrente
    + YOU: Planet? No, seriously, why am I here?
    + YOU: I sit in the corner and cry.
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda2
// TEST: DOMANDA 2: abilità EvidenziaIngredienti
DOGRON: All the people around youuuu talk about colors, but you haven't understood what they are. How do you try to understand something you don't understand so you don't get caught?
    + YOU: I don't know, I stopped studying at the three-table.
    + YOU: But all these lights? And why does the chair smell like wet dog?
    + YOU: I copy things other people do, hoping I don't screw up.
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
DOGRON: Something with a long mustache short hair and the ability to get into boxes has destroyed your favorite game. How do you react?
    + YOU: I destroy everything you hold dear.
    + YOU: But what does this have to do with a cooking contest?
    + YOU: Strange, all this reminds me of Kitty.
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda4
// TEST: DOMANDA 4: abilità ScelteLente
DOGRON: Someone you love very very much told youuuu he would be right back, but it's ten minutes later and still no sign of him. How do you deal with grief?
    + YOU: But are we here for therapy, or for a competition?
    + YOU: If you don't release me right now I'll call my lawyer!
    + YOU: I'd say it's time to get some sleep, chill out a little bit, catch up on the list of video games in the queue.
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
DOGRON: What is your favorite gruel, but like the suuuuuper favorite thing in the world for you?
    + YOU: lamb vindaloo
    + YOU: Please get me out of this place, please, what have I done wrong to you!!!?
    + YOU: The end of capitalism.
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
DOGRON: They take you to the playground. There's sunshine, lots of friends, and your favorite collar.
    + YOU: But where is the question?
    + YOU: This is perfection!
        ~ abilities += PNGParliExtra
    + YOU: Uh, what kind of collar? Even a harness?
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda7
// TEST: DOMANDA 7: abilità SaltaMorte
DOGRON: It's days that your tummy hurts, your whole tummy. They puuuut a leash on you and patpat on the trunk of the car. How do you react?
    + YOU: Please please free me I didn't do anything, my succulent plant will miss it!
    + YOU: I am a brave person, I will meet my destiny!
    ~ abilities += SaltaMorte
    + YOU: No fucking way. I bite their hand and escape to freedom!
    -
    {
    - LIST_COUNT(abilities) >= 3:
      -> finedomande
    - else: 
        -> domande
    }

= domanda8
// TEST: DOMANDA 8: abilità EliminaConcorrente
DOGRON: You buried someone, but you don't remember where you did it, and you're very sad, very. How do you react?
    + YOU: Oh. You're going to kill me, aren't you?
        DOGRON: No no, what are you talking about, it's not like you're a hotdog!
    + YOU: No body, no crime. I'm sorry, Ermenegildo.
        ~ abilities += EliminaConcorrente
    + YOU: I turn myself in to the police, voluntarily. Don't you think that's the sensible thing to do? You're going to do it right?
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
    DOGRON: The questions are over! And thanks to our very accurate psychological system approved by the Grand Council of Pugs and the Supreme Chihuahua, I, Dogron the III I awwwward you...

    -> recap(LIST_VALUE(LIST_MIN(LIST_ALL(abilities))))
}

= recap(i)

~ temp ability = abilities(i)
{abilities has ability:
    
    {ability:
    - EvidenziaIngredienti: DOGRON:...the ability to notice the ingredients right away!
    - ScelteLente: DOGRON:...the ability to slow down time.
    - SceltaIngrediente: DOGRON:...the luck of being able to choose an ingredient at the beginning of the recipe.
    - PNGParliExtra: DOGRON:...the right to chat with an extra person in the lounge.
    - SaltaMorte: DOGRON:...the, um, uh, theabilitytoskipyourdeathonce uh look at that beautiful a labrador!
    - EliminaConcorrente: DOGRON: The right to kick another person out of the program who is here to contestantatan. Cronestant. Contrestant. Someone that is here to play.
    - RichiamaConcorrente: DOGRON:...the power to call back the dead once. Woah!
    }
}
{i < LIST_VALUE(LIST_MAX(LIST_ALL(abilities))):
    -> recap(i+1)
}
-> passaggio_lounge_giorno_uno
