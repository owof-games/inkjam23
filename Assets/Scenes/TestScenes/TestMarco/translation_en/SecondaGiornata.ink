/***
RECAP:
GIORNO 2: 3 ingredienti, valori 1 (solo 1), 2, 3
Dialoghi giorno 1..4: ogni personaggio ti da 2 ingredienti
**/


=== passaggio_lounge_giorno_due
    ~ moveToLounge()
    
    -> inizio_lounge ->
    ~ temp num_loop_rimanenti = 3
    //RICETTA RICHIESTA: un pasto per quando vengono i veri amici.

    ~ loungeDialogue(DOGRON)
    DOGRON: But people friends, we are already on the second day of THE GOOD DOG (very very goooood dog!) SHOW!!! Aren't you super mega happy and wagging your tails!!!? Oh, hoooowwwww I would hate to see you all ever leave!
    DOGRON: But if we didn't eliminate someone, how could we find a perfect replacement for, for, for the larger kitchen of Uuuuuranus?
    DOGRON: And speaking of Uranus, today's theme is: a meal for when real friends come!
    DOGRON: I'll give you a few minutes for chit-chat and then we're off!
    // passa alla scena lounge
    
    
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
      
    * -> cucina_giorno_due
    
    
    = UgoEMimi_choice
    ~ loungeDialogue(UgoEMimi)
    //Ingredienti suggeriti: Vol-au-vent e Skyrim
    UgoEMimi: Mimi, no, you're the one who doesn't understand! Kojima compared it to <b>Skyrim</b>! And Kojima is never wrong!
        ~ dialogue_ingredients_of_the_day += Skyrim
    UgoEMimi: Ugo, I don't want to contradict you, you know, but it was a dream!
    UgoEMimi: And you tell me that dreams lie, huh! Didn't you dream of cooking forever, and now you see where we are?
    UgoEMimi: My dream was to open an electrician's tool store, not to cook <b>vol-au-vents</b> every Saturday for your boorish friends!
     ~ dialogue_ingredients_of_the_day += volAuVent
    UgoEMimi: Mimi, you're going too far now! And you know what happens when I get pissed off!
        + YOU: Mr. Hugh, so you are creating a video game?
            UgoEMimi: Oh, more than a video game, THE video game! It will be a stealth but not too much slasher shooter with 4X elements and a car race and resource management multiplayer mode with microtransactions, NFT and lots of DLC!
            UgoEMimi: But for now Ugo has only created the title and a cover with Paint.
        + YOU: Mrs. Mimi, so you're into electricality, is that what they say?
            UgoEMimi: A woman cannot be passionate about electricity, Mimi is only good at cleaning, cooking and ironing.
            UgoEMimi: In fact we only live in one house where I did all the grounding.
        + YOU: I don't know what you have, but in worship if you don't mind your own business you die badly. Bye.
        -
    
        -> loop
    
    = BeBe_choice
    ~ loungeDialogue(BeBe)
    //Ingredienti: blocchi d'erba e uova di pecora (sacrificio)
    BeBe: Well, hello there! Who would have thought I would survive the first day? Nella didn't make it.
    {not passaggio_lounge_giorno_uno.BeBe_choice: BeBe: Anyway, I didn't get a chance to introduce myself yesterday, I'm BeBe, single mother of eight, er, seven little lambs.}
        + You: Lala?
            BeBe: A long history, a long long history.
        + YOU: Why are you walking around with a cleaver?
            BeBe: Cleaver? What cleaver?
        + YOU: I feel sorry for those who got out. But sorry, who got out!!!
            BeBe: Do you think I remember the names of all of you, with my lambs at home?
        -
    BeBe: But let's talk about good things, given today's theme: do you have people friends waiting for you? I only have my eight, uh, seven daughters, and I'm their best friend.
    BeBe: The best mom and friend there is. I would do anything for them!
        + YOU: Of course, if you are convinced of it.…
        + YOU: I have Kitty waiting for me at home, she is my life.
        + YOU: There are a few people in the cult that I get along with, you know? But not too many.
        -
        + YOU: Do you have any secret recipes to focus on today?
        -
    BeBe: If I told you, it wouldn't be secret, would it?
    BeBe: Just kidding, if the theme is "food for friendly people," of course I agree.
    BeBe: And you are a friend to me aren't you?
        + YOU: Of course I do!
        + YOU: (lie) Of course I do!
        + YOU: (ironically) Of course I do!
        -
    BeBe: That reassures me. I don't like people who take me by the ears.
    BeBe: Anyway, I was thinking, what is true friendship? And of course I thought about my eight, er, seven daughters. And what do they love to do when we're all together? Video games!
    BeBe: It amuses me a lot when they say in an affectionate way, "No mom, don't play with us tonight, please!" They are so tender.
    BeBe: And so I was thinking of making baskets with fried <b>grass blocks</b>, and <b>sheep eggs</b>.
    ~ dialogue_ingredients_of_the_day += blocchiDiErba
    ~ dialogue_ingredients_of_the_day += uovaDiPecora
        + YOU: Sheep eggs?
        -
    BeBe: Sure. In friendship, sacrifice is important!!!
    BeBe: But now I have to go brood for a moment. See you later!
        + YOU: Um, later.
        -
        -> loop
    
    = Piiiietro_choice
    ~ loungeDialogue(Piiiietro)
    //Ingredienti: tonno in scatola e scolare
    Piiiietro: <b>Canned tuna</b>, <b>drain</b>.
       ~ dialogue_ingredients_of_the_day += tonno_in_scatola
        ~ dialogue_ingredients_of_the_day += scolare
        + YOU: I beg your pardon?
        + YOU: Ah, great, see you later.
        -> loop
        + YOU: Is that all you can cook?
        -
    Piiiietro: That I saw yesterday that you were watching what I was cooking. They all do that, copying other people's work, and then.
        + YOU: It may surprise you, but I cook even worse than you do.
            Piiiietro: Let's not exaggerate, I saw what you brought up yesterday!
        + YOU: Did you then find your dog?
            Piiiietro: No, and I found his Russian sable fur coat abandoned behind an armchair.
            Piiiietro: But he always does this when I forbid him to go on vacation somewhere.
        + YOU: But the rosary then?
            Piiiietro: I think I saw it on Dogron, I'll have to investigate further.
        -
    Piiiietro: However, yesterday the production told me that I can't leave, that I signed a contract, and that if the mistake is my agent's it doesn't change anything to them.
        + YOU: Agent?
        -
    Piiiietro: Math agent. We do challenges like rap, but with equations. It doesn't look like it but it's super tiring, last year two contestants died of dehydration just to finish, oh, I don't even remember what, I always win anyway.
    Piiiietro: I'm so good at math.
    Piiiietro: But now I say goodbye, that I have to fix the diamonds on my teeth before the episode.
    {not passaggio_lounge_giorno_uno.Piiiietro_choice: Piiiietro: Ah, we didn't introduce ourselves yesterday: my name is Piiiietro.}
        -> loop
        
    = Quello_choice
    ~ loungeDialogue(Quello)
    //Ingredienti: lacrime e cacao amaro
    {not passaggio_lounge_giorno_uno.Quello_choice: Quello: Hello! I am That One, or It, sometimes. I was watching you cook yesterday and woah, you're doing great!}
    Quello: I'm kind of struggling today, you know?
    Quello: All my "real friends" are dead, you know?
        + YOU: But like that dinosaur joke?
        + YOU: This is the time when I have to say I'm sorry, right?
        + YOU: I saw a very friendly sheep earlier. If you want to talk to her…
        -
    Quello: I won't bore you with this sad story, I promise. I can't help but think of recipes that don't have <b>tears</b> in them, though. Lots.
    ~ dialogue_ingredients_of_the_day += lacrime
        + YOU: Don't they spoil the flavor?
        -
    Quello: It depends. With <b>bitter cocoa</b>, the salty goes well with it. I might make a cake.
    ~ dialogue_ingredients_of_the_day += cacaoAmaro
    Quello: A cake not to be shared with any person.
    Quello: Except for Il Divo, which he would never eat, however, because it would gross him out on trust. And he's right.
    Quello: Sorry, sadness is forbidden by the labor contract. See you later, good luck!
        -> loop
    
    = ilDivo_choice
    ~ loungeDialogue(ilDivo)
    //Ingredienti: specchiarsi e scottare
    ilDivo: I get that it's the Pope, but it can wait, that I have to open a new office in Dubai before lunch, alright!!!?
        + YOU: But why do I persist in talking to this?
        -
    ilDivo: Why hello gorgeous! Have we met?
        + {passaggio_lounge_giorno_uno.ilDivo_choice} YOU: We talked together yesterday, like. Oprah, the cocaine, the saffron?
        + {not passaggio_lounge_giorno_uno.ilDivo_choice} YOU: I haven't had the luck yet, no.
        -
    ilDivo: They call me il Divo, but that's an understatement. He thinks the White House has a portrait of me, so to speak.
    ilDivo: Wikipedia has my picture under the definition of "Cool," not as the obvious preposition but what am I telling you that you may not have been in middle school but I already asked you, are you single?
        + YOU: Yes, and every time I meet a man I remember why.
        + YOU: No, I have someone waiting for me at home, but I don't know how to get back!
        + YOU: I think I have a crush on one of the people here in the studio.
        -
    ilDivo: Of course you then fall in love with me, of course. Bella Hadid decided not to <b>mirror</b> herself after she saw me.
        ~ dialogue_ingredients_of_the_day += specchiarsi
    ilDivo: But then life is difficult.
    ilDivo: Because they tell you, "Hey, how fortunate to be a species with 23000 different sexual genders, it must be a great bazaar," but then we have binary things too, and I end up falling in love, and…
    ilDivo: What am I telling you? I'm <b>hot</b> stuff baby, you can't just grab me like that! And now I have to work, work, produce, fill in the blank! Get out!
        ~ dialogue_ingredients_of_the_day += scottare
        -> loop



=== cucina_giorno_due

    ~ num_ingredients = 3

// passa alla scena della cucina
~ moveToKitchen()
// imposta gli ingredienti a disposizione per questa giornata
~ base_ingredients_of_the_day = (braciola, arrosticino, costina, osso, grigliare, crocchette, versare, riempire)

~ temp total = 0
~ temp num_loop_rimanenti = 3
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

-> passaggio_lounge_giorno_tre
