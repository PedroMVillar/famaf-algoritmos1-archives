-- ◆═════════════════════════════════════════════●★●═════════════════════════════════════════════◆
{-En este proyecto nos introducimos en la definición de nuestros propios tipos de datos. La 
importancia de poder definir nuevos tipos de datos reside en la facilidad con la que podemos modelar 
problemas y resolverlos usando las mismas herramientas que para los tipos pre-existentes.
El objetivo de este proyecto es aprender a declarar nuevos tipos de datos en Haskell y definir
funciones para manipular expresiones que utilizan estos tipos.-}
-- ◆═════════════════════════════════════════════●★●═════════════════════════════════════════════◆

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 1
-- a) Implementá el tipo Carrera como está definido arriba.
data Carrera = Matematica | Fisica | Computacion | Astronomia 
-- b) Definí la siguiente función, usando pattern matching : titulo :: Carrera -> String
-- que devuelve el nombre completo de la carrera en forma de string. Por ejemplo, para el
-- constructor Matematica, debe devolver ”Licenciatura en Matemática”.
titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matemática"
titulo Fisica = "Licenciatura en Física"
titulo Computacion = "Licenciatura en Ciencias de la Computación"
titulo Astronomia = "Licenciatura en Astronomía"
-- c ) Para escribir música se utiliza la denominada notación musical, la cual consta de
-- notas (do, re, mi, ...). Además, estas notas pueden presentar algún modificador ]
-- (sostenido) o [ (bemol), por ejemplo do], si[, etc. Por ahora nos vamos a olvidar de
-- estos modificadores (llamados alteraciones) y vamos a representar las notas básicas.
-- Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si.
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord, Bounded)
-- d ) El sistema de notación musical anglosajón, también conocido como notación o cifrado
-- americano, relaciona las notas básicas con letras de la A a la G. Este sistema se usa por
-- ejemplo para las tablaturas de guitarra. Programar usando pattern matching la función:
-- cifradoAmericano : : NotaBasica −> Char que relaciona las notas Do, Re, Mi, Fa, Sol, La y 
-- Si con los caracteres ’C’ , ’D’, ’E’, ’F’, ’G’, ’A’ y ’B’ respectivamente.
cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 2
-- a) Completar la definici ́on del tipo NotaBasica
-- "deriving (Show, Ord)"
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 3
-- a) Definir usando polimorfismo ad hoc la función minimoElemento que calcula cuál es
-- el menor valor de una lista de tipo [a]. Asegurarse que sólo esté definida para listas
-- no vac ́ıas.
minimoElemento :: (Ord a) => [a] -> a
minimoElemento (x:[]) = x
minimoElemento (x:y:xs)
    | x < y = minimoElemento (x:xs)
    | otherwise = minimoElemento (y:xs)
--b) Definir la función minimoElemento’ de manera tal que el caso base para la lista vacía
-- esté definido. Para ello revisar la clase Bounded.
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' [x] = x
minimoElemento' (x:y:xs)
    | x < y = minimoElemento (x:xs)
    | otherwise = minimoElemento (y:xs)
{-
ghci> minimoElemento [Fa, La, Sol, Re, Fa]
Re
-}
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 4
-- a) Implementá el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura,
-- Zona, etc) tal como están definidos arriba.
type Altura = Int
type NumCamiseta = Int
data Zona = Arco | Defensa | Mediocampo | Delante
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha
type ManoHabil = PiernaHabil
data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura
                
-- b) ¿Cuál es el tipo del constructor Ciclista?
-- Ciclista :: Modalidad -> Deportista
-- c ) Programá la función contar_velocistas :: [Deportista] -> Int que dada una
-- lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs.
-- Programar contar_velocistas sin usar igualdad, utilizando pattern matching.zc vbnm-
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista x):xs) = 1 + contar_velocistas xs
contar_velocistas ((Ciclista x):xs) = contar_velocistas xs
contar_velocistas ((Ajedrecista):xs) = contar_velocistas xs
contar_velocistas ((Tenista x y z):xs) = contar_velocistas xs
contar_velocistas ((Futbolista x y z e):xs) = contar_velocistas xs
-- d) Programá la función contar_futbolistas :: [Deportista] -> Zona -> Int que
-- dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
-- incluidos en xs que juegan en la zona z. No usar igualdad, sólo pattern matching.
fulboZona :: Deportista -> Zona -> Bool
fulboZona (Futbolista Arco x y z) Arco = True
fulboZona (Futbolista Defensa x y z) Defensa = True
fulboZona (Futbolista Mediocampo x y z) Mediocampo = True
fulboZona (Futbolista Delante x y z) Delante = True
fulboZona _ _ = False
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (x: xs) zona
      | fulboZona x zona = 1 + contar_futbolistas xs zona
      | otherwise = contar_futbolistas xs zona
-- e) ¿La función anterior usa filter? Si no es as ́ı, reprogramala para usarla.

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 5
-- a) Implement ́a la funci ́on sonidoNatural como est ́a definida arriba
sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11
-- b) Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural
-- y Sostenido.
data Alteracion = Bemol | Natural | Sostenido
-- c) Definir el tipo algebraico NotaMusical que debe tener un solo un constructor que llama-
-- remos Nota el cual toma dos parámetros. El primer parámetro es de tipo NotaBasica
-- y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una
-- nota alterada se puede usar como segundo parámetro del constructor un Bemol o
-- Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como
-- segundo par ́ametro.
data NotaMusical = Nota NotaBasica Alteracion
-- d ) Definí la función sonidoCromatico :: NotaMusical -> Int que devuelve el sonido
-- de una nota, incrementando en uno su valor si tiene la alteración Sostenido, decre-
-- mentando en uno si tiene la alteración Bemol y dejando su valor intacto si la alteración
-- es Natural
sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n a) =
  case a of
    Bemol -> valorNota - 1
    Sostenido -> valorNota + 1
    Natural -> valorNota
  where
    valorNota = sonidoNatural n
-- e) Incluí el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
-- mismo valor de sonidoCromatico se consideren iguales.
instance Eq NotaMusical where
  n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2 -- Nota 1 va a ser igual a nota 2 cuando
  -- el sonido cromatico sea igual. Agrego la instacia Eq
-- f) Incluí el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
-- que una nota es menor o igual a otra si y sólo si el valor de sonidoCromatico para la
-- primera es menor o igual al valor de sonidoCromatico para la segunda.
instance Ord NotaMusical where
  n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2 -- una nota va a ser menor o igual a otra
  -- cuando el sonido creomatico sea menor o igual al otro
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 6
-- a) Definir la función primerElemento que devuelve el primer elemento de una lista no
-- vacía, o Nothing si la lista es vacía.
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 7
-- a) Programá las siguientes funciones:
data Cola = VaciaC | Encolada Deportista Cola
-- 1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que está
-- en la primer posición de una cola, por haber sido atendida. Si la cola está vacía,
-- devuelve Nothing.
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada d c) = Just c
-- 2) encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
-- de deportistas, en la  ́ultima posición.
encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d1 (Encolada d2 c) = Encolada d2 (encolar d1 c)
-- 3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
-- futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
-- parámetro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC zona = Nothing
busca (Encolada (Futbolista z n p a) c) zona
  | fulboZona d zona = Just d
  | otherwise = busca c zona
  where
    d = Futbolista z n p a
busca (Encolada d c) zona = busca c zona
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 8
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)
    deriving (Show)
-- a) ¿Como se debe instanciar el tipo ListaAsoc para representar la información almacenada
-- en una guía telefónica?
type GuiaTelefonica = ListaAsoc Int String
-- Int = Numero telefonico / String = Direccion 
-- b) Programá las siguientes funciones
-- 1) la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una
-- lista.
la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b lA) = 1 + la_long lA
-- 2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que de-
-- vuelve la concatenación de dos listas de asociaciones.
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia la2 = la2
la_concat la1 Vacia = la1
la_concat (Nodo a b lA1) lA2 = Nodo a b (la_concat lA1 lA2)
-- 3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
-- agrega un nodo a la lista de asociaciones si la clave no está en la lista, o actualiza
-- el valor si la clave ya se encontraba.
la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo a b lA) a' b' | a == a' = Nodo a b' lA
                               | otherwise = Nodo a b (la_agregar lA a' b')
-- 4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asocia-
-- ciones en una lista de pares clave-dato.
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = [] 
la_pares (Nodo a b lA) = (a,b) : la_pares lA
-- 5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
-- y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
-- Nothing
la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia a = Nothing
la_busca (Nodo a b lA) a' | a == a' = Just b
                          | otherwise = la_busca lA a'
-- 6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
-- una clave a elimina la entrada en la lista.
la_borrar :: (Eq a) => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a' (Nodo a b lA) | a' == a = lA
                           | otherwise = Nodo a b (la_borrar a' lA)
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 9
data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)
-- a) a_long :: Arbol a -> Int que dado un  ́arbol devuelve la cantidad de datos alma-
-- cenados.
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama aIzq _ aDer) = 1 + a_long aIzq + a_long aDer
-- b) a_hojas :: Arbol a -> Int que dado un  ́arbol devuelve la cantidad de hojas.
a_vacio :: Arbol a -> Bool
a_vacio Hoja = True
a_vacio (Rama _ _ _) = False
a_hojas :: Arbol a -> Int
a_hojas Hoja = 0
a_hojas (Rama aIzq _ aDer) =
  if a_vacio aIzq && a_vacio aDer
    then 1
      else a_hojas aIzq + a_hojas aDer
-- c) a_inc :: Num a => Arbol a -> Arbol a que dado un  ́arbol que contiene n ́umeros,
-- los incrementa en uno
a_inc :: (Num a) => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama aIzq _ aDer) = 

-- d ) a_map :: (a -> b) -> Arbol a -> Arbol b que dada una función y un árbol,
-- devuelve el  ́arbol con la misma estructura, que resulta de aplicar la función a cada uno
-- de los elementos del árbol. Revisá la definición de la función anterior y reprogramala
-- usando a_map.
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map f Vacia = Vacia
a_map f (Rama aIzq a aDer) = Rama (a_map f aIzq) (p a) (a_map f aDer)  

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --