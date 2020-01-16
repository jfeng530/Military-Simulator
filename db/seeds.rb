User.destroy_all
Character.destroy_all
Element.destroy_all
Move.destroy_all
CharacterMove.destroy_all
Battle.destroy_all

john = User.create(username: "Kenobi")
ben = User.create(username: "Ben")

man = Element.create(name: "Infantry", hp: 10, info: "The ground units provide support.", sprite: "")
air = Element.create(name: "Air Forces", hp: 9, info: "They are in the sky.", sprite: "")
missle = Element.create(name: "Air Defense Artillary", hp: 11, info: "They will shoot you down.", sprite: "")


topgun = Character.create(name: "Tom Cruise from Top Gun", info: "I feel the need...", element: air)
rambo = Character.create(name: "John Rambo", info: "They drew first blood...", element: man)
walle = Character.create(name: "Wall-E", info: "Industrial Love Machine", element: missle)
dragon = Character.create(name: "A Dragon", info: "Somehow, the US Air Force got their hands on a dragon", element: air)
cena = Character.create(name: "John Cena", info: "You cant't see me", element: man)
barron = Character.create(name: "Red Barron", info: "Merry Christmas!", element: air)
braveheart = Character.create(name: "Mel Gibson from Braveheart", info: "They'll never take our freedom!", element: man)
fury = Character.create(name: "Brad Pitt from Fury", info: "Look at my haircut", element: missle)


gi = Character.create(name: "GI Joe", info: "America's hero", user: john, element: man)
f12 = Character.create(name: "F-12 Raptor", info: "I think it's a fighter jet", user: ben, element: air)
blueangel = Character.create(name: "Blue Angels", info: "All of the Blue Angels", user: john, element: air)
boat = Character.create(name: "Submarine", info: "I live under the sea", user: ben, element: missle)
battleship = Character.create(name: "Rhianna from Battleship", info: "Don't sink it", user: john, element: missle)




launch = Move.create(name: "Launch Missle", damage: 2, info: "launches a missle", element: missle, effect: "Damage")
explode = Move.create(name: "Explosive Rocket", damage: 3, info: "launches an explosive round", element: missle, effect: "Damage")
longrange = Move.create(name: "Long Range Missile", damage: 2, info: "launches a long range missle", element: missle, effect: "Damage")
hydro = Move.create(name: "Hydro Rocket", damage: 1, info: "launches a water balloon", element: missle, effect: "Damage")
repair = Move.create(name: "Repair", damage: 2, info: "repairs themselves", element: missle, effect: "Heal")
airepair = Move.create(name: "AI Repair", damage: 2, info: "fixes their computers or something", element: missle, effect: "Heal")
tire = Move.create(name: "Rethread Tires", damage: 2, info: "rethreads their tires", element: missle, effect: "Heal")
reload = Move.create(name: "Reload", damage: 2, info: "reloads ammunication", element: missle, effect: "Amplify")
laser = Move.create(name: "Laser Beam", damage: 3, info: "fires lazer beam", element: missle, effect: "Hurt")
armor = Move.create(name: "Armor Up", damage: 2, info: "armors up", element: missle, effect: "Protect")
gun = Move.create(name: "Minigun", damage: 2, info: "fires minigun", element: missle, effect: "Damage")
ram = Move.create(name: "Ram", damage: 2, info: "rams", element: missle, effect: "Hurt")


openfire = Move.create(name: "Open Fire", damage: 1, info: "shoots", element: air, effect: "Damage")
burn = Move.create(name: "Burn", damage: 1, info: "lights a match and throws it", element: air, effect: "Hurt")
fthrower = Move.create(name: "Flame Thrower", damage: 2, info: "uses a flamethrower", element: air, effect: "Hurt")
fblast = Move.create(name: "Fire Blast", damage: 3, info: "blasts a shit ton of fire", element: air, effect: "Hurt")
airmissle = Move.create(name: "Missles", damage: 2, info: "launches a missle", element: air, effect: "Damage")
bomb = Move.create(name: "Bomb", damage: 3, info: "drops a fat one", element: air, effect: "Damage")
napalm = Move.create(name: "Napalm", damage: 3, info: "drops naplam", element: air, effect: "Hurt")
flare = Move.create(name: "Flare", damage: 0, info: "deploys flares", element: air, effect: "Protect")
barrel = Move.create(name: "Barrel Roll", damage: 0, info: "does a barrel roll", element: air, effect: "Protect")
chaff = Move.create(name: "Chaff", damage: 0, info: "deploys chaffs", element: air, effect: "Protect")
strafe = Move.create(name: "Strafe Run", damage: 3, info: "preparing for a strafe fun", element: air, effect: "Amplify")
carpet = Move.create(name: "Carpet Bomb", damage: 3, info: "drops a lot of bombs", element: air, effect: "Damage")


charge = Move.create(name: "Charge", damage: 0, info: "charges", element: man, effect: "Amplify")
speech = Move.create(name: "Give Speech", damage: 2, info: "gives a rousing speech", element: man, effect: "Amplify")
punch = Move.create(name: "Punch", damage: 2, info: "forms a fist and launches it", element: man, effect: "Damage")
hide = Move.create(name: "Hide", damage: 0, info: "hides", element: man, effect: "Protect")
grenade = Move.create(name: "Throw Grenade", damage: 3, info: "throws a grenade", element: man, effect: "Damage")
bandage = Move.create(name: "Band-Aid", damage: 3, info: "puts a Band-Aid on their boo-boo", element: man, effect: "Heal")
shotgun = Move.create(name: "Shotgun", damage: 3, info: "empties a shotgun", element: man, effect: "Damage")
knife = Move.create(name: "Knife", damage: 3, info: "stabs", element: man, effect: "Hurt")
smoke = Move.create(name: "Smoke Grenade", damage: 0, info: "throws a smoke grenade", element: man, effect: "Protect")
radio = Move.create(name: "Radio", damage: 2, info: "radios for help", element: man, effect: "Amplify")
dual = Move.create(name: "Dual Wield", damage: 4, info: "grabs another gun", element: man, effect: "Amplify")
airstrike = Move.create(name: "Air Strike", damage: 4, info: "calls in air strike", element: man, effect: "Damage")


CharacterMove.create(character: gi, move: charge) 
CharacterMove.create(character: gi, move: grenade) 
CharacterMove.create(character: gi, move: bandage) 
CharacterMove.create(character: gi, move: radio)

CharacterMove.create(character: f12, move: openfire) 
CharacterMove.create(character: f12, move: bomb) 
CharacterMove.create(character: f12, move: chaff) 
CharacterMove.create(character: f12, move: carpet) 

CharacterMove.create(character: blueangel, move: barrel) 
CharacterMove.create(character: blueangel, move: strafe)
CharacterMove.create(character: blueangel, move: airmissle)
CharacterMove.create(character: blueangel, move: burn) 

CharacterMove.create(character: boat, move: ram) 
CharacterMove.create(character: boat, move: hydro) 
CharacterMove.create(character: boat, move: longrange) 
CharacterMove.create(character: boat, move: airepair) 

CharacterMove.create(character: topgun, move: barrel) 
CharacterMove.create(character: topgun, move: openfire) 
CharacterMove.create(character: topgun, move: airmissle) 
CharacterMove.create(character: topgun, move: strafe) 

CharacterMove.create(character: rambo, move: punch) 
CharacterMove.create(character: rambo, move: knife) 
CharacterMove.create(character: rambo, move: shotgun) 
CharacterMove.create(character: rambo, move: grenade) 

CharacterMove.create(character: walle, move: hydro) 
CharacterMove.create(character: walle, move: laser) 
CharacterMove.create(character: walle, move: ram) 
CharacterMove.create(character: walle, move: airepair) 

CharacterMove.create(character: dragon, move: fthrower) 
CharacterMove.create(character: dragon, move: burn) 
CharacterMove.create(character: dragon, move: barrel) 
CharacterMove.create(character: dragon, move: fblast) 

CharacterMove.create(character: cena, move: speech) 
CharacterMove.create(character: cena, move: punch) 
CharacterMove.create(character: cena, move: bandage) 
CharacterMove.create(character: cena, move: airstrike) 

CharacterMove.create(character: barron, move: carpet) 
CharacterMove.create(character: barron, move: strafe) 
CharacterMove.create(character: barron, move: flare) 
CharacterMove.create(character: barron, move: bomb) 

CharacterMove.create(character: braveheart, move: charge) 
CharacterMove.create(character: braveheart, move: speech) 
CharacterMove.create(character: braveheart, move: knife) 
CharacterMove.create(character: braveheart, move: punch) 

CharacterMove.create(character: fury, move: launch) 
CharacterMove.create(character: fury, move: repair) 
CharacterMove.create(character: fury, move: gun) 
CharacterMove.create(character: fury, move: ram) 

CharacterMove.create(character: battleship, move: hydro) 
CharacterMove.create(character: battleship, move: laser) 
CharacterMove.create(character: battleship, move: reload) 
CharacterMove.create(character: battleship, move: explode) 





puts "It has been seeded."