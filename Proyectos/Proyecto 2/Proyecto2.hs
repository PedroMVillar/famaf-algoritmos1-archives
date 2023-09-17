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
{-
ghci> :t Matematica
Matematica :: Carrera
ghci> :t Fisica
Fisica :: Carrera
-}
-- c ) Para escribir música se utiliza la denominada notación musical, la cual consta de
-- notas (do, re, mi, ...). Además, estas notas pueden presentar algún modificador ]
-- (sostenido) o [ (bemol), por ejemplo do], si[, etc. Por ahora nos vamos a olvidar de
-- estos modificadores (llamados alteraciones) y vamos a representar las notas básicas.
-- Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si.
data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord, Bounded)
{-
ghci> :t Do
Do :: NotaBasica
ghci> :t Si
Si :: NotaBasica
-}
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
{-
ghci> cifradoAmericano Do
'C'
ghci> cifradoAmericano Fa
'F'
-}
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
{-
ghci> minimoElemento [Do, Re, Fa, Si]
Do
ghci> minimoElemento [Mi, Fa, La, Si]
Mi
-}
--b) Definir la función minimoElemento’ de manera tal que el caso base para la lista vacía
-- esté definido. Para ello revisar la clase Bounded.
minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' [x] = x
minimoElemento' (x:y:xs)
    | x < y = minimoElemento (x:xs)
    | otherwise = minimoElemento (y:xs)
{-
ghci> minimoElemento' [Fa, La, Sol, Re, Fa]
Re
ghci> minimoElemento' [Mi, Fa, La, Si]
Mi
-}
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 4
-- a) Implementá el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura,
-- Zona, etc) tal como están definidos arriba.
type Altura = Int
type NumCamiseta = Int
data Zona = Arco | Defensa | Mediocampo | Delante deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show
type ManoHabil = PiernaHabil 
data Deportista = Ajedrecista
                | Ciclista Modalidad
                | Velocista Altura
                | Tenista TipoReves ManoHabil Altura
                | Futbolista Zona NumCamiseta PiernaHabil Altura
                deriving Show
                
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
{-
ghci> contar_velocistas [Velocista 173, Ajedrecista, Futbolista Arco 3 Derecha 180]
1
ghci> contar_velocistas [Velocista 173, Ciclista Pista, Velocista 168, Velocista 98, Ajedrecista]
3
-}
-- d) Programá la función contar_futbolistas :: [Deportista] -> Zona -> Int que
-- dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
-- incluidos en xs que juegan en la zona z. No usar igualdad, sólo pattern matching.
fulboZona :: Zona -> Deportista -> Bool
fulboZona Arco (Futbolista Arco _ _ _) = True
fulboZona Defensa (Futbolista Defensa _ _ _) = True
fulboZona Mediocampo (Futbolista Mediocampo _ _ _) = True
fulboZona Delante (Futbolista Delante _ _ _) = True
fulboZona _ _ = False
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (x: xs) zona
      | fulboZona zona x = 1 + contar_futbolistas xs zona
      | otherwise = contar_futbolistas xs zona
{-
ghci> contar_futbolistas [Futbolista Defensa 8 Derecha 180, Ajedrecista, Tenista DosManos Izquierda 170] Defensa
1
ghci> contar_futbolistas [Futbolista Defensa 8 Derecha 180, Ajedrecista, Tenista DosManos Izquierda 170] Arco
0
-}
-- e) ¿La función anterior usa filter? Si no es así, reprogramala para usarla.
contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' xs zona = length (filter(fulboZona zona) xs)
{-
ghci> contar_futbolistas' [Futbolista Defensa 8 Derecha 180, Ajedrecista, Tenista DosManos Izquierda 170] Arco
0
ghci> contar_futbolistas' [Futbolista Defensa 8 Derecha 180, Ajedrecista, Tenista DosManos Izquierda 170] Defensa
1
-}
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
{-
ghci> sonidoCromatico (Nota Do Sostenido)
1
ghci> sonidoCromatico (Nota La Bemol)
8
-}
-- e) Incluí el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
-- mismo valor de sonidoCromatico se consideren iguales.
instance Eq NotaMusical where
  n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2 -- Nota 1 va a ser igual a nota 2 cuando
  -- el sonido cromatico sea igual. Agrego la instacia Eq
  {-
  ghci> (Nota La Bemol) == (Nota Do Sostenido)
  False
  ghci> (Nota La Natural) == (Nota La Natural)
  True
  -}
-- f) Incluí el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
-- que una nota es menor o igual a otra si y sólo si el valor de sonidoCromatico para la
-- primera es menor o igual al valor de sonidoCromatico para la segunda.
instance Ord NotaMusical where
  n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2 -- una nota va a ser menor o igual a otra
  -- cuando el sonido cromático sea menor o igual al otro
  {-
  ghci> (Nota La Bemol) <= (Nota Do Sostenido)
  False
  ghci> (Nota La Natural) >= (Nota La Natural)
  True
  -}
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 6
-- a) Definir la función primerElemento que devuelve el primer elemento de una lista no
-- vacía, o Nothing si la lista es vacía.
primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just x
{-
ghci> primerElemento [Do, Re, Mi, Fa]
Just Do
ghci> primerElemento "hola"
Just 'h'
-}
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 7
-- a) Programá las siguientes funciones:
data Cola = VaciaC | Encolada Deportista Cola
  deriving (Show)
-- 1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que está
-- en la primer posición de una cola, por haber sido atendida. Si la cola está vacía,
-- devuelve Nothing.
atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada d c) = Just c
{-
ghci> atender (Encolada Ajedrecista (Encolada Ajedrecista VaciaC))
Just (Encolada Ajedrecista VaciaC)
ghci> atender (Encolada Ajedrecista VaciaC)
Just VaciaC
-}
-- 2) encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
-- de deportistas, en la  ́ultima posición.
encolar :: Deportista -> Cola -> Cola
encolar d VaciaC = Encolada d VaciaC
encolar d1 (Encolada d2 c) = Encolada d2 (encolar d1 c)
{-
ghci> encolar (Velocista 189) (Encolada Ajedrecista (Encolada Ajedrecista VaciaC))
Encolada Ajedrecista (Encolada Ajedrecista (Encolada (Velocista 189) VaciaC))
-}
-- 3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
-- futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
-- parámetro. Si no hay futbolistas jugando en esa zona devuelve Nothing.
busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC zona = Nothing
busca (Encolada (Futbolista z n p a) c) zona
  | fulboZona zona d = Just d
  | otherwise = busca c zona
  where
    d = Futbolista z n p a
busca (Encolada d c) zona = busca c zona
{-
ghci> busca (Encolada Ajedrecista (Encolada (Futbolista Arco 189 Izquierda 4) VaciaC)) Arco
Just (Futbolista Arco 189 Izquierda 4)
-}
-- b) ¿A qué otro tipo se parece Cola?
-- Se puede ver una similitud con el tipo Lista de Haskell donde VaciaC podria ser [] y
-- Encolada representaria la definición recursiva de la lista a:[]
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
{-
ghci> la_long (Nodo 1 2 (Nodo 8 3 (Vacia)))
2
-}
-- 2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que de-
-- vuelve la concatenación de dos listas de asociaciones.
la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia la2 = la2
la_concat la1 Vacia = la1
la_concat (Nodo a b lA1) lA2 = Nodo a b (la_concat lA1 lA2)
{-
ghci> la_concat (Nodo 1 2 (Nodo 8 3 (Vacia))) (Nodo 2 3 (Nodo 3 2 (Vacia)))
Nodo 1 2 (Nodo 8 3 (Nodo 2 3 (Nodo 3 2 Vacia)))
-}
-- 3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
-- agrega un nodo a la lista de asociaciones si la clave no está en la lista, o actualiza
-- el valor si la clave ya se encontraba.
la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo a b lA) a' b' | a == a' = Nodo a b' lA
                               | otherwise = Nodo a b (la_agregar lA a' b')
{-
ghci> la_agregar (Nodo 1 2 (Nodo 8 3 (Vacia))) 3 4
Nodo 1 2 (Nodo 8 3 (Nodo 3 4 Vacia))
-}
-- 4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asocia-
-- ciones en una lista de pares clave-dato.
la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = [] 
la_pares (Nodo a b lA) = (a,b) : la_pares lA
{-
ghci> la_pares (Nodo 1 2 (Nodo 8 3 (Vacia)))
[(1,2),(8,3)]
-}
-- 5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
-- y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
-- Nothing
la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe b 
la_busca Vacia a = Nothing
la_busca (Nodo a b lA) a' | a == a' = Just b
                          | otherwise = la_busca lA a'
{-
ghci> la_busca (Nodo 1 2 (Nodo 8 3 (Vacia))) 8
Just 3
ghci> la_busca (Nodo 1 2 (Nodo 8 3 (Vacia))) 1
Just 2
ghci> la_busca (Nodo 1 2 (Nodo 8 3 (Vacia))) 9
Nothing
-}
-- 6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
-- una clave a elimina la entrada en la lista.
la_borrar :: (Eq a) => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a' (Nodo a b lA) | a' == a = lA
                           | otherwise = Nodo a b (la_borrar a' lA)
{-
ghci> la_borrar 9 (Nodo 1 2 (Nodo 8 3 (Vacia)))
Nodo 1 2 (Nodo 8 3 Vacia)
ghci> la_borrar 2 (Nodo 1 2 (Nodo 8 3 (Vacia)))
Nodo 1 2 (Nodo 8 3 Vacia)
ghci> la_borrar 1 (Nodo 1 2 (Nodo 8 3 (Vacia)))
Nodo 8 3 Vacia
-}
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 9
data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving (Show)
-- a) a_long :: Arbol a -> Int que dado un  ́arbol devuelve la cantidad de datos alma-
-- cenados.
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama aIzq _ aDer) = 1 + a_long aIzq + a_long aDer
{-
ghci> a_long (Rama (Rama (Hoja) 9 (Hoja)) 1 Hoja)
2
ghci> a_long (Rama (Rama (Hoja) 9 (Hoja)) 1 (Rama (Rama (Rama Hoja 2 Hoja) 7 Hoja) 8 (Rama Hoja 2 Hoja)))
6
-}
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
{-
ghci> a_hojas (Rama (Rama (Hoja) 9 (Hoja)) 1 Hoja)
1
ghci> a_hojas (Rama (Rama (Hoja) 9 (Hoja)) 1 (Rama (Rama (Rama Hoja 2 Hoja) 7 Hoja) 8 (Rama Hoja 2 Hoja)))
3
-}
-- c) a_inc :: Num a => Arbol a -> Arbol a que dado un árbol que contiene números,
-- los incrementa en uno
a_inc :: (Num a) => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama aIzq a aDer) = Rama (a_inc aIzq) (a + 1) (a_inc aDer)
{-
ghci> a_inc (Rama (Rama (Hoja) 9 (Hoja)) 1 (Rama (Rama (Rama Hoja 2 Hoja) 7 Hoja) 8 (Rama Hoja 2 Hoja)))
Rama (Rama Hoja 10 Hoja) 2 (Rama (Rama (Rama Hoja 3 Hoja) 8 Hoja) 9 (Rama Hoja 3 Hoja))
ghci> a_inc (Rama (Rama (Hoja) 9 (Hoja)) 1 Hoja)
Rama (Rama Hoja 10 Hoja) 2 Hoja
-}
-- d) a_map :: (a -> b) -> Arbol a -> Arbol b que dada una función y un árbol,
-- devuelve el  ́arbol con la misma estructura, que resulta de aplicar la función a cada uno
-- de los elementos del árbol. Revisá la definición de la función anterior y reprogramala
-- usando a_map.
a_map :: (a -> b) -> Arbol a -> Arbol b
a_map f Hoja = Hoja
a_map f (Rama aIzq a aDer) = Rama (a_map f aIzq) (f a) (a_map f aDer)  
{-
ghci> a_map (*7) (Rama (Rama (Hoja) 9 (Hoja)) 1 Hoja)
Rama (Rama Hoja 63 Hoja) 7 Hoja
ghci> a_map (/5) (Rama (Rama (Hoja) 9 (Hoja)) 1 Hoja)
Rama (Rama Hoja 1.8 Hoja) 0.2 Hoja
-}
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ -- 