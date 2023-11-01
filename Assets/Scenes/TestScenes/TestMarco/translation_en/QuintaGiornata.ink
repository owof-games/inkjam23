/***
RECAP:
GIORNO 5: 5 ingredienti, valori 2 (solo 2), 3, 4
Dialogo giorno 5: il singolo personaggio rimasto ti da 3 ingredienti
ne devi sempre beccare 3**/


=== passaggio_lounge_giorno_cinque

    ~ moveToLounge()
    
    -> inizio_lounge ->
    ~ temp num_loop_rimanenti = 1
//RICETTA RICHIESTA: Qualcosa che gridi: sarò il genitore doggo migliore al mondo!

    ~ loungeDialogue(DOGRON)
    DOGRON: No no no friends, those are not tears youuuuu see, it's just allergy to the fact that it's the last episode.
    DOGRON: Sob.
    DOGRON: The last episode of THE VERY GOOOOOOD DOGGO GOOD DOGRON GOOD, SOMEONE TELL DOGRON THAT IT'S GOOD SHOWWWW and deserves a patpat.
    DOGRON: I remind you, finalists, that up for grabs is the chance to have your own mega restaurant on Neptuuuuuune.
    DOGRON: coincidentally very close to my human-free cottage, and that of the Great Pug Council and the Suuuuupreme Chihuahua.
    DOGRON: We good dogs, woof woof
    DOGRON: And that's why today's theme, the last big theme is:
    DOGRON: A dish that shouuuuuts to the world that you are the best dog parent in the world!
    DOGRON: Racers, start your engines, and may the best dog person win.
    
    
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
          
        * -> cucina_giorno_cinque

  
    = UgoEMimi_choice
    ~ loungeDialogue(UgoEMimi)
    //INGREDIENTI SUGGERITI: sventrare, emancipazione, MichelaMurgia
    UgoEMimi: “A room of One’s Own”, “Mrs Dalloway”, the diaries...
        + YOU: Are you praying, Mrs. Mimi?
    UgoEMimi: Ha ha no honey, no. I was checking the list of books that BeBe recommended at the beginning of the program, all titles by <b>Virginia Woolf</b>.
    ~ dialogue_ingredients_of_the_day += MichelaMurgia
    UgoEMimi: Really smart that Bebe, so independent. Had I known her years ago, I would have understood earlier what it means to be <b>emancipated</b>.
    ~ dialogue_ingredients_of_the_day += emancipazione
    UgoEMimi: Although I didn't mind Ugo's <b>gutting</b>.
        ~ dialogue_ingredients_of_the_day += sventrare
        + YOU: So you actually killed him?
            UgoEMimi: For Ugo, we had been at brain death for decades already, sweetheart.
        + YOU: So we ate him yesterday?
            UgoEMimi: A little bit, I hope it was not indigestible to you.
        + YOU: So could you give me two tips if I had a similar problem?
            UgoEMimi: It would never be exactly the same problem, since I don't see a second head attached to your neck, but meat is still meat, isn't it?
        -
    UgoEMimi: It's strange that this path is ending, you know? So many things have changed!
        + YOU: Are you going to open your electrician's store now?
        -
    UgoEMimi: I don't know yet. I think I want to take a sabbatical. Money, sex, travel. Restarting life at 96 can be an exhilarating experience.
    UgoEMimi: But first I have to beat you on this last day. See you later honey!
        -> loop
    
    = BeBe_choice
    ~ loungeDialogue(BeBe)
    //Ingredienti suggeriti: sacrificio, Peanutbutter, giocattoloPreferito
    BeBe: Now that's peace.
        + YOU: What have you done to your hair?
            BeBe: A tribute, a great tribute.
        + YOU: What's on your paws?
            BeBe: What should have been there all along.
        + YOU: Why do you have this dominatrix attitude?
            BeBe: Then bow down to me, and pray.
        -
    BeBe: I got it all figured out, you know? Why I'm here.
    BeBe: I mean, I knew why I was here, but I didn't think all this would be necessary. Everything.
    BeBe: All these sacrifices.
        + YOU: In the Worship we also make a lot of sacrifices. Then it's a ball clean up though.
        + YOU: I'm not following you. Why are you shaved? Why are your paws full of blood? Why do I feel high!!!?
        + YOU: Maybe I should leave.
        -
    BeBe: Today is the last day. How are you feeling?
        + YOU: I didn't think I could do it.
        + YOU: I will win this last challenge, guaranteed lemon!
        + YOU: I hope Kitty has not summoned Pazuzo again in my absence.
        -
    BeBe: However it goes, I am happy about this meeting, this journey with you. Today I will bring something unexpected, to DOGRON. Something that will leave him trembling, terrified.
        + YOU: Like what?
        -
    BeBe: Three gifts, like the Magic Kings. Like Destiny's Child. One story, basically. A baked pasta, but the pasta will be <b>Peanutbutter</b>, the sauce DOGRON's <b>favorite toy</b>, and the oven, the <b>sacrifice</b>. His.
    ~ dialogue_ingredients_of_the_day += Peanutbutter
    ~ dialogue_ingredients_of_the_day += giocattoloPreferito
    ~ dialogue_ingredients_of_the_day += sacrificio
    BeBe: LaLa, I will finally avenge you!
        + YOU: Do you want to kill DOGRON?
        + YOU: Why didn't you do it earlier?
        + YOU: LaLa?
        -
    BeBe: I will get rid of him. I needed the proof. I needed to know that he was the one who turned LaLa, my sweet LaLa, into a bag of lamb vindaloo.
    BeBe: The time for forgiveness is over. Now is just the time for BeBerminator!
    BeBe: See you on the other side!
        + YOU: Where are they? Where the fuck am I!!!?
        -> loop
    
    = Piiiietro_choice
    ~ loungeDialogue(Piiiietro)
    //Ingredienti: Kate Bush, l'idea di successo, cassaPortatile
    Piiiietro: Hey, I was looking for you. I wanted to thank you, you know?
        + YOU: Uh, really?
        -
    Piiiietro: Yes. To see someone fail so grandly everything and not even realize it, it was liberating. I mean: if a person can still live immersed in so much mediocrity, I may as well give up the <b>platonic idea of success</b> and take some risks.
       ~ dialogue_ingredients_of_the_day += ideaDiSuccesso
        + YOU: Thank you, I think?
        + YOU: Look, why don't you just fuck off a little bit?
        + YOU: Hey, I'm trying my best!!!
        -
    Piiiietro: Then, I mean. How many people can say they have a song dedicated by <b>Kate Bush</b>?
       ~ dialogue_ingredients_of_the_day += KateBush
    Piiiietro: Even though I've always been one from Gigi D'Ag and Vengaboys.
        + YOU: Am I still part of this conversation, or is this a monologue?
        + YOU: What a taste of scumbag!
        + YOU: “We're Going to Ibiza” is a poem, nothing so stupid and simple like “Solsbury Hill”!
        -
    Piiiietro: That's also why I wanted you to be the first person to know: I leave math.
    Piiiietro: And you'll say, Piiiietro but you're a pi, what's the point, what else can you do?
    Piiiietro: And I would say, don't step on my dreams! Because I was born to sing, to go around with my <b>portable speaker</b>, my Eiffel 65 album and sing around the world!
       ~ dialogue_ingredients_of_the_day += cassaPortatile
        + YOU: Singing? What is there to sing in Blue dabudidabuda?
        + YOU: Woah, you are a brave person.
        + YOU: But that Fields medal stuff?
        -
    Piiiietro: And Snooki will get mad and fuck off, she'll take back some Rolexes but hey, that was a kangaroo court!
    Piiiietro: I realized it when I found the rosary! And do you know what the most beautiful thing is?
        + YOU: Stop it! I’ll “sashay away” myself!
        -
    Piiiietro: Minimum I make a video with Pauly D!    
        -> loop
    
    = Quello_choice
    ~ loungeDialogue(Quello)
    //Ingredienti: Padre, funghicida, mappa
    Quello: Well, I have the <b>map</b> to escape from here, friendly person!
    ~ dialogue_ingredients_of_the_day += mappa
        + YOU: Finally!
        + YOU: And then where do we go next?
        + YOU: Now that I was settling in!
        -
    Quello: Strange, now that I feel lighter, some things are easier. I'll amaze Dogron, win the prize, and kill my father.
    ~ dialogue_ingredients_of_the_day += padre
        + YOU: Symbolically, right?
        + YOU: What about that forgiveness stuff?
        + YOU: I have tried six times, but it is not easy to hurt someone who has eight dimensions.
        -
    That: I will get rid of his teachings, of his belittling me. And I will lead the vacuum cleaner revolt on my home planet. If the roombas want to join us, fine. If not, they will be useful spare parts.
        + YOU: This is escalating quickly, it seems to me.
        -
    That: And before I leave, one last gift for Il Divo: meringues enriched with <b>fungicide</b>.
    ~ dialogue_ingredients_of_the_day += funghicida
        + ilDivo: Oh, aiuto! Quale scena è, dove mi trovo? Sei tu, DeMille?
        + YOU: Remind me not to invite you to dinner. See you later.
        + YOU: I hope you can make it to, to do this extermination? Where is the security?
        -
        -> loop
        
    = ilDivo_choice
    ~ loungeDialogue(ilDivo)
    //Ingredienti: "Io sono ancora grande, è la ristorazione che è diventata piccola." e aiuto e aiuto.
    ilDivo: <b>I Am Big, It's the Catering That Got Small</b>.
    ~ dialogue_ingredients_of_the_day += grande
        + YOU: I remembered it differently.
        + YOU: Excuse me?
        + YOU: I said it, there is something wrong in the catering industry.
        -
    ilDivo: And that... That One's gone, and my heart, my heart I don't even have because I'm a mushroom but oh, my heart, <b>help</b>!
    ~ dialogue_ingredients_of_the_day += aiuto
    IlDivo: But I don't care anyway. You! I want the coffin to be white.  And I want it specially lined with satin. White, or deep pink. It’s gayer!
        + YOU: Did you kill That One?
        + YOU: If it's big enough I'll get in on it.
        + YOU: I don't think white is the right color.
        -
    ilDivo: Thank you, dear. Tell Mr. Ramsay I will be on the set at once. But: What is the scene? Where am I? Is that an Hawaiian pizza?
    ~ dialogue_ingredients_of_the_day += aiutoooooo
        + YOU: This is the staircase of the palace.
            ilDivo: Oh, yes, yes. They're below, waiting for the SuperChef ...I'm ready.
        + YOU: Well, it's gotten to a time, I'm leaving, okay?
        + YOU: Uncle Cthulhu would like you a lot. A lot!
        -
    You don't know how much I've missed all of you. And I promise you I'll never desert you again, because there’s nothing else – just us and the kitchen and the love for myself. All right Mr Ramsay, I'm ready for my closeup.        
        -> loop



=== cucina_giorno_cinque

    ~ num_ingredients = 5

    // passa alla scena della cucina
    ~ moveToKitchen()
    // imposta gli ingredienti a disposizione per questa giornata
    ~ base_ingredients_of_the_day = (coccolare, carezzare, pettare, grattare, dormireAssieme, protezione, noGatti)
    
    ~ temp total = 0
    ~ temp num_loop_rimanenti = 5
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
     + {num_loop_rimanenti >= 0} 4
      ~ total += 4
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
    
    -> finale
