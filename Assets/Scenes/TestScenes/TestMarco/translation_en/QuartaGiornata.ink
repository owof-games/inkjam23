/***
RECAP:
GIORNO 4: 4 ingredienti, valori 2 (solo 2), 3; AGGIUNGERE 3 AL RISULTATO
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/

TODO: dopo aver fatto i conti delle PNG, fare funzione che permetta che il numero di loop non superi il numero di personagge vive.

=== passaggio_lounge_giorno_quattro

   ~ moveToLounge()
    
    -> inizio_lounge ->
    ~ temp num_loop_rimanenti = 1
 //RICETTA RICHIESTA: qualcosa per accettare il cambiamento. 

    ~ loungeDialogue(DOGRON)
    DOGRON: Tail, come here! Tail, tail! Stop! Bad tail, bad tail!
    DOGRON: Oh, are we on the air?
    DOGRON: Welcome to the fourth and penuuuultimate episode of THE VERY GOOD DOGGO GOOD DOGGO GOOD DOGGO! AND SHOW! Here is your favorite host, right I am youuuuur favorite host?
    DOGRON: Who is the best host in the world? Who is he?
    DOGRON: Today's theme concerns us all. That theme that comes to mind when your favorite mug breaks, or the kibble is newwwww and tastes unexpected, or the mailman has a clean uniform.
    DOGRON: Or when they get a puppy and they tell youuuu that everything will stay the same but it's not true, that puppy starts walking, going to stuuuding and you got attached to it and he forgets about you.
    DOGRON: Today's theme is change, something to accept change.
    DOGRON: Another great idea from Supreme Chihuahua and the Pug Council.
    DOGRON: You can chat with each other for a moment, and then we start cooking.
    DOGRON: Come here, tail!
    
    
    ~ dialogue_ingredients_of_the_day = ()
    
    { abilities has PNGParliExtra:
      ~ num_loop_rimanenti += 1
    }
    - (loop)
    ~ num_loop_rimanenti -= 1
    ~ loungeDialogue(DOGRON)
    
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
          
        * -> cucina_giorno_quattro
  
  
    = UgoEMimi_choice
    ~ loungeDialogue(UgoEMimi)
    //INGREDIENTI: Mazinga e Le orecchie di Ugo    
    UgoEMimi: Well, hello there, gorgeous!
        + YOU: Mrs. Mimi, I notice something different!
        -
    UgoEMimi: Uh, it will be the haircut. I was inspired by Venusia from <b>Mazinga</b>. Uh, you know how I had a crush on Tetsuya?
            ~ dialogue_ingredients_of_the_day += Mazinga
        + YOU: He had his why with that topknot.
        + YOU: But Mr. Ugo?
        + YOU: No, I meant the fact that she is missing a head, like.
        -
    UgoEMimi: I feel so light today, you know? I haven't in a long time. First I got into soldering some electrical sockets, and helped the cameraman with a problem with his android circuits.
    HughEMimi: And to celebrate the change, as requested by Dogron and his dog friends, I think I will make an Olivier salad with <b>Ugo's ears</b>.
            ~ dialogue_ingredients_of_the_day += orecchieUgo
            + YOU: I remember Eustacchio's, with mushrooms they were the bomb.
            + YOU: Maybe we'd better hear what the jury thinks first?
            + YOU: Will Mr. Ugo miss it?
            -
    UgoEMimi: But I'm going now, sweetheart, that I have an appointment with a certain android. See you later!        
        -> loop
    
    = BeBe_choice
    ~ loungeDialogue(BeBe)
    //Ingredienti: avvelenare e collare con un'etichetta: DOGRON
    BeBe: Accept, of course. He's right.
        + YOU: Are you all right, BeBe?
        -
    BeBe: Yes yes yes, I'm just in a hurry. Change, it's important to embrace change. Change, for my eight, no, seven daughters. Seven.
        + YOU: How come you always quote your daughters?
        -
    BeBe: Because every mother's duty is to protect them. And if she fails, to retaliate. Bring about change.
        + YOU: Should I preocupate myself?
        -
    BeBe: No, tu no. Ma oggi porterò una ricetta davvero speciale, sai? Change requires risk, and for that I'm going to use hemlock. A little bit of <b>poison</b>, betting on how fatal it can be. And the killer's <b>necklace</b>.
    ~ dialogue_ingredients_of_the_day += avvelenare
    ~ dialogue_ingredients_of_the_day += collareconetichetta
        + YOU: Um, I think I left the cat in the oven.
        + YOU: Maybe the air on the planet is hurting you?
        + YOU: But are you dripping milk?
        -
    BeBe: Acceptance. You have to accept it all. See you later, bye.    
        -> loop
    
    = Piiiietro_choice
    ~ loungeDialogue(Piiiietro)
    //Ingredienti: Tonno in scatola al naturale (più punti) e cantare
    Piiiietro: Finally, he left.
        + YOU: Who?
        -
    Piiiietro: Bruiser. He left me a letter, telling me that he has found a Chihuahua Supreme, and that he will live with her. That he sent a service cat and retrieve her leopard bowls and satin and diamond kennel, and invites me not to look for him.
    Piiiietro: He thanks me for these years together, but he thinks it's time for him to be with someone who doesn't hide from others. Who doesn't pretend to be infinite, he says.
        + YOU: What do you mean?
        + YOU: I'm sorry, I guess?
        + YOU: Bruiser can write!!!
        -
    Piiiietro: He's right, you know? You, you show yourself as you are, to the world?
        + YOU: I mean, if people saw the gifts I took from my ancient father, they would be blinded by madness.
        + YOU: In the Cult I learned to hide who I am so that I could get everything.
        + YOU: I tried it once. Lots of alcohol, police, a few days in jail for indecent exposure. Poor sheep.
        -
    Piiiietro: Gee, you've had an interesting life!
    Piiiietro: My... Bruiser is probably right, you know? I don't really live. I have to, I have to say things out loud. But it's so fucking scary for me to do that.
        + YOU: We've been kidnapped, we're on a planet the size of an Ikea store, we won't know what will become of us tomorrow. If you don't tell her today, when?
            Piiiietro: But it is difficult!
        + YOU: I would have a commitment…
            Piiiietro: Two minutes!
        + YOU: BeBe sounds to me like a reach to listening, you know?
            Piiiietro: When he has to say my name though, he gets wrapped up.
        -
    Piiiietro: Stasera accoglierò anche io il cambiamento, sai? Like Bruiser. No more pasta with canned tuna. I'll make pasta with <b>natural canned tuna</b>! And I will present it by <b>singing</b>.
       ~ dialogue_ingredients_of_the_day += tonnoalnaturale
        ~ dialogue_ingredients_of_the_day += cantare
    Piiiietro: Uh, I said it. I have to run now, see you later!
        -> loop
    
    = Quello_choice
    ~ loungeDialogue(Quello)
    //Ingredienti: perdonare e evolversi
    Quello: Get a hug!
        + YOU: You look great, That One!
        + YOU: Mmm, first get the dust off.
        + YOU: Um, where do I put my right hand?
        -
    Quello: I didn't expect it, but this path is becoming a real journey, you know? A journey toward <b>forgiving</b> even those who have hurt you.
    ~ dialogue_ingredients_of_the_day += perdonare
    Quello: Like forgiving my father. He didn't invent roomba against me, against us.
    Quello: It was the people, lazy people, who got rid of us vacuum cleaners in favor of those, those who are maybe my brothers, don't you think?
        + YOU: I just feel a great confusion in my head now.
        + YOU: But so he is not Il Divo your father?
        + YOU: I have never cleaned my house, so I don't know what you are talking about.
        -
    Quello: And then you have to evolve. I think, I have, it's silly, you know?
    ~ dialogue_ingredients_of_the_day += evolversi
        + YOU: That One, I think it's silly this whole situation, if not ridiculous.
        + YOU: "Silly" is accidentally killing Ermenegildo, and then forgetting about it, and taking him to Disneyworld and talking to him all day and even paying for the ticket!
        + YOU: My brain is leaking out of my ears now.
        -
    Quello: I couldn't forgive my father, so I sought another one. I put my energy, my trust in il Divo. Another arrogant man.
    Quello: But I am a good person in me, don't you think? Even though we were all thrown into dumpsters. Even if my father created something to replace us all. Even if il Divo will never give me his approval.
    Quello: I am the one who has to approve himself, and that's it.
        + YOU: That's deep, bro!
        + YOU: In the Cult this is subversive thinking, you know?
        + YOU: What about me, who approves of me? You? Dogron? Who!?!?
        -
    Quello: Now I'm going to go to il Divo, and tell him I'm quitting. Also, I'm going to win this program!    
        
        -> loop
    
    = ilDivo_choice
    ~ loungeDialogue(ilDivo)
    //Ingredienti: iomestessomemedesimo e #selfcare
        ilDivo: Uh, my favorite competitor person! How are you doing?
            + YOU: I find myself here without understanding how. I'm moving forward and I don't understand in what. How am I supposed to be!!!
            + YOU: I think I just saw a cucumber make a declaration of love to a dead cameraman.
            + YOU: I never would have said it, but I miss the Worship. The rites, the dead, the blood, the escapes from the exorcists.
            -
        ilDivo: You certainly have a fabulous life, don't you?
        ilDivo: But never as much as mine!
            + YOU: You thought so.
            -
        ilDivo: I have found true love. Here, on this tiny planet, I understood everything. I stopped for a moment, a hit of cocaine and a moment of <b>hashtag selfcare</b< and there he was, the true love of my life!
            ~ dialogue_ingredients_of_the_day +=selfcare
            + YOU: Bruiser?
            + YOU: Ermenegildo?
            + YOU: The Supreme Chihuahua?
            -
        theDivo: <b>Me,myself and I</b>. There is only one great love in this life, and I can only be me. Just.
            ~ dialogue_ingredients_of_the_day += iomestessomemedesimo
        ilDivo: Do you want to celebrate my marriage to myself?
            + YOU: I'm sorry but I have to have my ears pricked out before continuing this show.
            + YOU: I can't, I have to drop a spotlight on my head and hope to die.
            + YOU: Sure, after taking a bath with my beloved toaster.
            -
        ilDivo: How much I feel loved!    
        -> loop


=== cucina_giorno_quattro

    ~ num_ingredients = 4

    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (pettorina, trasportino, veterinario, automobile, viaggiare, inconscio, correreneisogni)
    
    ~ temp total = 3
    ~ temp num_loop_rimanenti = 4
    - (loop)
    ~ num_loop_rimanenti -= 1
    Total is {total}
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
    
    ~ moveToLounge()
    ~ loungeDialogue(DOGRON)

{ 
- not success && not ScampataLaMorte && abilities has SaltaMorte:
  ~ ScampataLaMorte = true
  ~ abilities -= SaltaMorte
  DOGRON: Uh, you should have lost, but you have the bonus that you can save yourself once ! Lucky for you, yes yes !
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
    
    -> passaggio_lounge_giorno_cinque
