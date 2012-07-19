def prompt()
  print '> '
end
 
def death()
  quips = ["You died.  You kinda suck at this.",
           "Nice job, you died ...jackass.",
           "Such a luser.",
           "I have a small puppy that's better at this."]
  puts quips[rand(quips.length())]
  Process.exit(1)
end

def central_corridor()
  puts %{
    The Gothans of Planet Percal #25 have invaded your ship and destroyed
    your entire crew. You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory,
    put it in the bridge, and blow the ship up after getting into an
    escape pod.
    \n
    You're running down the central corridor to the Weapons Armory when
    a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
    flowing around his hate filled body. He's blocking the door to the 
    Armory and about to pull a weapon to blast you.}

    prompt()
    action = gets.chomp()

    if action == "shoot!"
      puts <<-END
      Quick on the draw you yank out your blaster and fire it as the Gothan.
      His clown costume is flowing and moving around his body, which throws
      off your aim. Your laser hits his costume but misses him entirely. This
      compeletely ruins his brand new costume his mother bought him, which
      makes him fly into an insane rage and blast you repeatedly in the face until
      you are dead. The he eats you.
      END
      return :death
    elsif action == "dodge!"
      puts %{
        Like a world class boxer you dodge, weave, slip and slide right
        as the Gothon's blaster cranks a laser past your head.
        In the middle of your artful dodge your foot slips and you 
        bang your head on the metal wall and pass out.
        You wake up shortly  after only to die as the Gothon stomps on
        your head and east you. }
        return :death
    elsif action == "tell a joke"
      puts %{
        Lucky for you they made you learn Gothon insults in the academy.
        You tell the one Gothon joke you know:
        Lbhe zbgure vg gb sng, jura fur fvgf nebhaq gur ubhrf, fur fvgf nebhaq gur ubhf
        While he's laughing you run up and shoot him square in the head
        putting him down, then jump through the Weapon Armary door. }
        return :laser_weapon_armory
    else
      puts "DOES NOT COMPUTE!"
      return :central_corridor
    end
end

def laser_weapon_armory()
  puts %{
    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding. It's dead quiet, too quiet.
    You stand up and run the the far side of the room and find the
    neutron bomb in its container. There's a keypad lock on the box
    and you need the code to get the bomb out. If you get the code
    wrong 10 times then the lock closes forever and you can't 
    get the bomb. The code is 3 digits. }
    code = "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]
    print "[keypad]> "
    guess = gets.chomp()
    guesses = 0

    while guess != code and guesses < 10
      puts "BZZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = gets.chomp()
    end
   if guess == code
     puts %{
       The contianer clicks open and the seal breaks, letting gas out.
       You grab the neutron bomg and run as fast as you can to the
       bridge where you must place it in the right spot."}
       return :the_bridge
   else
     puts %{ The lock buzzes one last time and then you hear a sickening
             melting sound as the mechanism is fused together
             You decide to sit there, and finally the Gothons blow up the 
             ship from their ship and you die. }
             return :death
   end
end

def the_bridge()
  puts %{ You burst onto the Bridge with the netron destruct bomb
          under your arm and suprise 5 Gothons who are trying to
          take control of the ship. Each of them has an even uglier
          clown costume than the last. They haven't pulled their
          weapons out yet, as they see the active bomb under your
          arm and don't want to set it off.}

          prompt()
          action = gets.chomp()

          if action == "throw the bomb"
            puts %{ In a panic you throw the bomb at the gropu of Gothons
                    and make a leap for the door. Right as you drop it a 
                    Gothon shoots you right in the back killing you.
                    As you die you see another Gothon frantically try to disarm
                    the bomb. You die knowing they will probably blow up when
                    it goes off. }
                    return :death

          elsif action == "slowly place the bomb"
            puts %{ You point your blaster at the bomb under your arm
                    and the Gothons put their hands up and start to sweat.
                    You inch backward to the door, open it, and then carefuly
                    place the bomb on the floor, pointing your blaster at it.
                    You then jump back through the door, punch the close button
                    and blast the lock so the Gothons can't get out.
                    Now that the bomb is placed you run the escape pod to
                    get off this tin can. }
                    return :escape_pod
          else
            puts "DOES NOT COMPUTE!"
            return :the_bridge
          end
end

def escape_pod()
  puts %{
    You rush through the ship desperately trying to make it to
    the escape pod before the whole ship explodes. It se3ems like
    hardly any Gothons are on the ship, so your run is clear of
    interference. You get the chamber with the escape pods, and
    now need to pick one to tkae. Some of them could be damaged
    but you don't have time to look. There's 5 pods, which one
    do you take? }

    good_pod = rand(5) + 1
    print "[pod #]>"
    guess = gets.chomp()

    if guess.to_i != good_pod
      puts %{
        You jump into pod #{guess} and hit the eject button.
        The pod escapes out inot the void of space, the
        implodes as the hull ruptures, crushing your body
        into jam jelly.}
        return :death
    else
      puts %{
        You jump inot pod #{guess} and hit the eject button.
        The pod easily slides out inot space heading to
        the planet below. As it flies to the planet, you look
        back and see your ship implode then expllode like a
        bright star, taking out the Gothon ship at the same
        time. You won! }
        Process.exit(0)

    end
end

ROOMS = {
  death:method(:death),
  central_corridor:method(:central_corridor),
  laser_weapon_armory:method(:laser_weapon_armory),
  the_bridge:method(:the_bridge),
  escape_pod:method(:escape_pod)
}

def runner(map, start)
  next_one = start

  while true
    room = map[next_one]
    puts "\n---------"
    next_one = room.call()
  end
end

runner(ROOMS, :central_corridor)
  






