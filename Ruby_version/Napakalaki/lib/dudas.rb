# to_s player (ponerlo siquiera ?)
# bc.isEmpty (posible error ???? no?)

# si Player no tiene un pendingBC es que NO ha perdido aun ?
# no sé si aunque pierda o gane siempre se aplica antes
# revisar valid_state de player por eso

# buena sintaxis en napakalaki.rb -> setEnemies ?

# canMakeTreasureVisible -> player.rb pasar tesoro de oculto a visible según las
# reglas del juego => no se puede pasar si tiene ya equipado uno?

# en nextPlayer de napakalaki.rb dice el guión que hay que devolver el jugador
# siguiente pero también actualizar currentPlayer, sin embargo más adelante
# en nextTurn hace esta asignación con @currentPlayer = nextPlayer lo cual
# es exactamente lo mismo repetido

# giveMeATreasure -> player hace falta quitarlo del array?

# badConsequence constructor muerte modificado segun guionP3

# substractVisible/HiddenTreasure -> bC.rb checkear

# adjustToFitTreasureList -> bC.rb checkear