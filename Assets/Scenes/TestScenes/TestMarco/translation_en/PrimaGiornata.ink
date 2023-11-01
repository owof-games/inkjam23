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
    DOGRON: But, let’s officially start!
    DOGRON: Contestants, with this first episode of THE GOOD DOG SHOW today we will put youuuu to the test by asking you to...
    DOGRON: Coooooking something that you would eat every day!
    DOGRON: You have a few minutes to chat amongst yourselves, before buuuuut in thekitchen. Translated into the programme rules: a maximum of {num_loop_rimanenti+1}people!
    DOGRON: It's up to you to decide whether you want to share your secrets,trick other people, or get scratched! And be carefuuuuuuul, because in THE GOOD DOGeverything changes in the blink of an eye!

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
    UgoEMimi: Ugo, I don't think so.
    UgoEMimi: Mimi, I decide when it's appropriate. And it just so happens thatthere is a lot of money here and I need a publisher!
    UgoEMimi: Ugo, a stranger is watching us.
        + YOU: Um, hello!
            UgoEMimi: Hello, I am Ugo, and this is my wife Mimi. MINE.
        + YOU: Are you also here against your will?
            UgoEMimi: Well, my husband…
            UgoEMimi: Mimi is shy but yes, we are here because we want to be.
        + YOU: Nice haircut, madam!
            UgoEMimi: My merit, I chose her hairdresser, as a good husband must do!
        -
    UgoEMimi: And you, what are you doing here?
    UgoEMimi: Ugo, don't be rude, we are all tense from this news!
        + YOU: I wonder about that too.
        + YOU: I think it's a punishment from the Cult.
        + YOU: I only remember my room, some chloroform.…
        -
    UgoEMimi: Do you need a hand with the cooking, darling?
    UgoEMimi: Mimi! Why are you helping the competition? I need the money for thepublisher!
    UgoEMimi: Ugo, it's not that I want to tell this person that for a perfectaspic, the secret is the best <b>isinglass</b> and<b>filter</b> it gently.
        ~ dialogue_ingredients_of_the_day += colladipesce
        ~ dialogue_ingredients_of_the_day += filtrare
        + YOU: Thank you ma'am, but the 1980s have been over since that day!
        + YOU: I haven't had an aspic since the day they sacrificed Grandma toAdramelech for my initiation, so many memories!
        + YOU: Madam, if you need help, blink twice.
            YOU: In this light you can't understand shit. Try again!
        -
    UgoEMimi: Mimi, let's go! I think I saw a chick with an iPod, maybeshe's an audio designer!    
        
        
        -> loop
    
    = BeBe_choice
    //Ingredienti suggeriti: cipolla e affettare
    ~ loungeDialogue(BeBe)
    BeBe: Yet I was sure I put them here, darn it!
        + YOU: Have you lost something?
        -
    BeBe: My sunglasses! I don't like to walk around without them.
        + YOU: You have them on, you know?
            BeBe: Uh, how distracted I am! You know, having eight, er, seven daughters makes everything difficult.
        + YOU: But there is no sun here. Maybe not even on the whole planet.
            BeBe: There is grass though, I can smell it!
        + YOU: Mmm yes yes of course.
            BeBe: Are you quoting that new K-Pop group, the Blink of an eye?
        -
    BeBe: But how are you finding yourself here, sweetheart? Do you have everything you need?
        + YOU: I don't know where I am, I just want to run away.
            BeBe: If I win, I promise to take you with me, I still have a spare bedroom!
        + YOU: Last time I cooked, my house exploded.
            BeBe: It happens to all people sooner or later.
        + YOU: I'm not supposed to be here. The Cult is looking for me.
            BeBe: Cult?
        -
        + YOU: More importantly, what did you decide to cook for the first episode?
        -
    BeBe: Uh you know, while being a working sheep, being a single mother of eight, ouch, seven little lambs forces you to deal with money.
    BeBe: So I think I will make some bread and <b>onion</b> soup to <b>slice</b>.
    BeBe: Onion makes everything taste great, and it costs nothing.
    ~ dialogue_ingredients_of_the_day += cipolla
    ~ dialogue_ingredients_of_the_day += affettare
        + YOU: Uh, now I understand why you have bad breath.
        + YOU: I'm more of a snack person, you know?
        + YOU: Thank you for the advice.
        -
    BeBe: I haven't introduced myself anyway! I'm Bebe. Now I'm going to get ready for the cooking phase, hope to see you soon!
        + YOU: Good luck.
        + YOU: I will beat you.
        + YOU: How do we get out of here!?!?
        -
        -> loop
    
    = Piiiietro_choice
    ~ loungeDialogue(Piiiietro)
    //Ingredienti suggeriti: tonno in scatola e mescolare
    Piiiietro: Bruiser Woods! Where did you go? Jesus, you took away my Gucci’s rosary too!
    Piiiietro: I told Snooki, oh if I told her, that it was a bad idea, but she didn't, no! Bruiser.
        + YOU: Bruiser Woods?
            Piiiietro: Yes, like that Bruiser, and I can't find it!
        + YOU: Gucci’s rosary?
            Piiiietro: Yes, a gift from my grandmother Scianel to celebrate my 16th birthday.
        + YOU: Snooki?
            Piiiietro: Sorry, I signed an NDA, that's all I can say.
        -
    Piiiietro: She'll be back, I hope. This planet looks tiny anyway, there won't be any more doggies.
    Piiiietro: Anyway pleasure, I am Piiiietro, a math student. When I was fourteen years old, I solved the Collatz game.
    Piiiietro: A fifteen the Navier-Stokes equations but I haven't received the Fields medal yet because after that Perel'man thing they are afraid of messing up.
    Piiiietro: But you're not understanding a goddamn thing, are you?
        + YOU: Actually Perel'man in middle school used to copy me.
        + YOU: I'm still thinking about the Gucci’s rosary.
        + YOU: No, but last week I got the change right the first time at the supermarket.
        -
    Piiiietro: Sure sure, anyway I'm worried because if I don't find the rosary beads my grandmother will kill me, you know?
    Piiiietro: The whole family. They're all so religious, think they have a holy card of Miuccia Prada on the fireplace, blinking her eyes.
    Piiiietro: They forced me to study mathematics to confirm the existence of God and Donatella Versace.
        + YOU: And you are also a very good cook, then?
        -
    Piiiietro: Cook? What do you mean, cook?
        + YOU: Well, this is a cooking program, I think they kidnapped us etc etc.
        -
    Piiiietro: Aren't we on The Voice!!!?
        + YOU: Should we sing about that huge gas stove?
        + YOU: I feel like I've been locked up tight, for a century of lonely nights, waiting for someone to release me…
        + YOU: No thanks, I'd rather have been really kidnapped.
        -
    Piiiietro: But I can just cook a plate of pasta with <b>canned tuna</b> and <b>stir</b>, the fuck am I doing here?
       ~ dialogue_ingredients_of_the_day += tonno_in_scatola
        ~ dialogue_ingredients_of_the_day += mescolare
    Piiiietro: Bruiser, Bruiser where are you? We've got to get out of here! See you later, or never!
    
        -> loop
    
    = Quello_choice
    //Ingredienti suggeriti: burro e montare
    ~ loungeDialogue(Quello)
    Quello: Hello lunar splendor! Don't you think this place is magnificent?
        + YOU: But do you know how you got here?
        + YOU: I think I saw a body before behind the camera. And it winked at me.
        + YOU: Still better than the Worship Church, I think.
        -
    Quello: I feel a little bit of pressure, you know? All these professional people, and me being just a little pastry chef, as Il Divo always reminds me. Very very very small. Infimous almost.
        + YOU: Il Divo?
            Quello: Yes, my boss, a strict but loving man in his own way. He forced me to come here, so if I win the money goes to his restaurant.
        + YOU: Do you let him tell you these things?
            Quello: Every learner deserves the lesson of humility, don't you think?
        + YOU: The most complex thing I've cooked is a caprese, and I lost a finger in it.
            Quello: Il Divo says it's important to always leave something of yourself in what we cook, you know?
        -
    Quello: Anyway pleasure, my name is That One. Sometimes It, sometimes That Other. People can be so creative.
    Quello: How will you try to impress Dogron?
        + YOU: By not hurting anyone.
        + YOU: Escaping while all of you are cooking.
        + YOU: Fried eggs?
        -
    Quello: Woah, you have the clearest ideas! I wanted to go for meringues, but Il Divo last time called them too meringue-y, and that's no good. He understands what's right in a blink of an eye!
    Quello: I only know how to make cakes, so I was thinking of taking some <b>butter</b> and a few other things, patiently <b>whipping</b> everything by hand and making some simple macaroon.
    ~ dialogue_ingredients_of_the_day += burro
    ~ dialogue_ingredients_of_the_day += montare
        + YOU: Simple. Sure. Simple.
        -
    Quello: Now I'm going to go clean the nails of Il Divo, who poor guy alone can't. See you later, it was nice talking to you. Talking, in general.    
        
     
        -> loop
    
    = ilDivo_choice
    ~ loungeDialogue(ilDivo)
    //Ingredienti suggeriti: zafferanno e mantecare
    ilDivo: No no, no Oprah for me, I certainly don't stoop to her level!
    ilDivo: Hey, hey you!
        + YOU: You're talking to me?
        -
    ilDivo: Yes, to you, there are no other people around. Ah no, yes, I was on the phone with the secretary. Again. What do you have some special <b>saffron</b>?
    ~ dialogue_ingredients_of_the_day += zafferano
        + YOU: I'm going to hear from the dealer for a moment and tell you.
            ilDivo: Okay, hear if he also has cocaine then.
        + YOU: Is that why you're all yellow?
            ilDivo: Look I'm red. Did Dogron teach you the colors?
        + YOU: Do you have any idea where we are, instead?
            ilDivo: Useless intern. Always useless, christ!
        -
    ilDivo: No no, I wasn't talking to you. Oh Christ, listen, I'll talk to you later. And make sure you get those three hours of unpaid overtime that we agreed on, okay?!?!
    ilDivo: And clean the kitchen, I don't care if the restaurant is closed.
    ilDivo: Here I am, you're obviously wondering what I'm doing here.
        + YOU: You're talking to me?
        -
    ilDivo: And who else, lazybones!!!? You want an autograph, I suppose?
    ilDivo: Or my secret to <b>whipping up</b> my risotto alla milanese?
    ~ dialogue_ingredients_of_the_day += mantecare 
    ilDivo: Are you single?
    ilDivo: Ah, but don't waste my time. Look for me That One, and bring me a couple of ounces of caviar and coke for the sample snack.
    -> loop

=== cucina_giorno_uno

    ~ num_ingredients = 3

    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (uova, farina, saltare, sciogliere, lievitare, sale)
    //QUESTA ROBA QUI SOTTO è PER UNITY
    ~ temp total = 0
    ~ temp num_loop_rimanenti = 3
    - (loop)
    ~ num_loop_rimanenti -= 1
    Total is {total}
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
    ~ loungeDialogue(DOGRON)

{ 
- not success && not ScampataLaMorte && abilities has SaltaMorte:
  ~ ScampataLaMorte = true
  ~ abilities -= SaltaMorte
  DOGRON: Uh, you should have lost, but you have the bonus that allows you to save yourself once ! Lucky for you, yes yes !
- not success:
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
