
@array & @otro_array
  Devuelve un tercer array con los elementos que pertenecen a
    ambos arrays (la intersección) SIN DUPLICADOS
  Ejemplo: [a, a, b, c] & [a, a, a, c, d] -> [a, c]

@array.collect { |item| block }
  Invoca 'block' para cada elemento del array. Devuelve un nuevo
    array con los elementos devueltos por 'block'.
    Si se ejecuta @array.collet! se sustituye cada elemento del
    array por el valor devuelto por 'block'.
  Ejemplo en: BadConsequence.adjustToFitTreasureLists

@array.count
@array.count (obj)
@array.count { |item| block }
  Devuelve el número de elementos.
  Si le pasamos obj, cuenta el número de veces que aparece el 
    objeto en el array
  Si le pasamos el bloque, cuenta el número de elementos que 
    devuelven true del bloque
  Ejemplo en: BadConsequence.adjustToFitTreasureLists

@array.delete (obj)
  Elimina todos los objetos del array que son iguales que obj.
    Devuelve el último objeto eliminado o nil si no se ha 
    eliminado ninguno.
  Ejemplo en: NOT FOUND

@array.delete_at (index)
  Elimina la componente en la posición 'index' de @array. Devuelve
    ese elemento o nil si index estáfeura del rango.
  Ejemplo en: BadConsequence.substractVisibleTreasure

@array.delete_if { |@item| block }
  Elimina todas las componentes del vector para las cuales el bloque
    devuelve true.
  Ejemplo en: NOT FOUND

@array.each { |item| block }
  Llama a 'block' @array.size-veces pasándole ese elemento como 
    parámetro
  Ejemplo en Napakalaki.SetEnemies

@array.empty?
  Devuelve true si el @array está vacío y false en caso contrario.
  Ejemplo en: CardDealer.nextMonster

@array.first
  Devuelve el primer elemento del array.
  Ejemplo en: Napakalaki.nextPlayer  
  
@array.index(obj)
  Deuelve el index del primero elemento del array que cumpla 
    que es  == a obj.
  Devuelve nil si no lo encuentra.
  Ejemplo en: BadConsequence.substractVisibleTreasure

@array.last
  Devuelve el último elemento del array.
  Ejemplo en: Napakalaki.nextPlayer  
  
@array.reverse_each
Igual que @array.each pero recorriendo el array en sentido inverso.
  Ejemplo en: Player.DiscardAllTreasures.

@array.sample
  Devuelve un elemento aleatorio del array.
  Ejemplo en: Napakalaki.nextPlayer

@array.shift
  Devuelve el primer elemento de @array y lo elimina del array. Si
    el array está vacío, devuelve nill.
  Ejemplo en: CardDealer.nextTreasure

@array.shuffle
  Baraja las componentes de un array. @array.shuffle devuelve 
    una copia del vector barajado mientras que @array.shuffle! 
    baraja el array @array
  Ejemplo en: CardDealer.shuffleMonsters

@array.size
  Devuelve el numero de elementos del array.