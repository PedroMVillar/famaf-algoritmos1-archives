--1.a) Implement´a el tipo Carrera como est´a definido arriba.

data Carrera = Matemática | Física | Computación | Astronomía

--1.b) Defin´ı la siguiente funci´on, usando pattern matching: titulo :: Carrera -> String
--que devuelve el nombre completo de la carrera en forma de string. Por ejemplo, para el
--constructor Matematica, debe devolver ”Licenciatura en Matem´atica”.

funcion :: Carrera -> String
funcion Matemática = "Licenciatura en Matemática Aplicada"
funcion Física = "Licenciatura en Física"
funcion Computación = "Licenciatura en Ciencias de la Computación"
funcion Astronomía = "Licenciatura en Astronomía"

--1.c) Para escribir m´usica se utiliza la denominada notaci´on musical, la cual consta de
--notas (do, re, mi, ...). Adem´as, estas notas pueden presentar alg´un modificador ]
--(sostenido) o [ (bemol), por ejemplo do], si[, etc. Por ahora nos vamos a olvidar de
--estos modificadores (llamados alteraciones) y vamos a representar las notas b´asicas.
--Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Eq, Ord, Bounded)

--1.d) El sistema de notaci´on musical anglosaj´on, tambi´en conocido como notaci´on o cifrado
--americano, relaciona las notas b´asicas con letras de la A a la G. Este sistema se usa por
--ejemplo para las tablaturas de guitarra. Programar usando pattern matching la funci´on:
--que relaciona las notas Do, Re, Mi, Fa, Sol, La y Si con los caracteres ’C’ , ’D’, ’E’,
-- ’F’, ’G’, ’A’ y ’B’ respectivamente.

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

--2.a) Completar la definici´on del tipo NotaBasica para que las expresiones

-- Main> Do <= Re
-- Main> Fa `min` Sol

--sean v´alidas y no generen error. Ayuda: usar deriving con m´ultiples clases.

-- data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Show, Ord)

--3.a) Definir usando polimorfismo ad hoc la funci´on minimoElemento que calcula (de manera
--recursiva) cu´al es el menor valor de una lista de tipo [a]. Asegurarse que s´olo est´e
--definida para listas no vac´ıas.

minimoElemento :: (Ord a) => [a] -> a
minimoElemento [x] = x
minimoElemento (x:y:xs) | x > y = minimoElemento (y:xs)
                        | x < y = minimoElemento (x:xs)

--3.b) Definir la funci´on minimoElemento’ de manera tal que el caso base de la recursi´on
--sea el de la lista vac´ıa. Para ello revisar la clase Bounded.

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' [x] = x
minimoElemento' (x:y:xs) | x > y = minimoElemento' (y:xs)
                         | x < y = minimoElemento' (x:xs)

--3.c) Usar la funci´on minimoElemento para determinar la nota m´as grave de la melod´ıa:
--[Fa, La, Sol, Re, Fa]
-- ghci> minimoElemento' [Fa, La, Sol, Re, Fa]
-- Re

--4.a) Implement´a el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura,
--Zona, etc).

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

--4.b) ¿Cu´al es el tipo del constructor Ciclista?
-- Ciclista tiene el tipo de constructor Ciclista :: Modalidad -> Deportista

--4.c) Program´a la funci´on contar_velocistas :: [Deportista] -> Int que dada una
--lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs.
--Programar contar_velocistas sin usar igualdad, utilizando pattern matching.

contar_velocistas :: [Deportista] -> Int
contar_velocistas ((Ajedrecista):xs) = contar_velocistas xs
contar_velocistas ((Ciclista x):xs) = contar_velocistas xs
contar_velocistas ((Tenista x y z):xs) = contar_velocistas xs
contar_velocistas ((Futbolista x y z n):xs) = contar_velocistas xs
contar_velocistas ((Velocista x):xs) = 1 + contar_velocistas xs

--4.d) Program´a la funci´on contar_futbolistas :: [Deportista] -> Zona -> Int que
--dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas
--incluidos en xs que juegan en la zona z. No usar igualdad, s´olo pattern matching.


--hago una fucnión auxiliar que se fija si está el futbolista en la zona
futbo_encontrado :: Zona -> Deportista -> Bool
futbo_encontrado Arco (Futbolista Arco _ _ _) = True
futbo_encontrado Defensa (Futbolista Defensa _ _ _) = True
futbo_encontrado Mediocampo (Futbolista Mediocampo _ _ _) = True
futbo_encontrado Delante (Futbolista Delante _ _ _) = True
futbo_encontrado _ _ = False


contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] zona = 0
contar_futbolistas (x:xs) zona 
                            | futbo_encontrado zona x = 1 + contar_futbolistas xs zona
                            | otherwise = contar_futbolistas xs zona

--4.e) ¿La funci´on anterior usa filter? Si no es as´ı, reprogramala para usarla.



--5.a) Implement´a la funci´on sonidoNatural como est´a definida arriba.

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--5.b) Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural
--y Sostenido.

data Alteracion = Bemol | Natural | Sostenido

--5.c) Definir el tipo algebraico NotaMusical que debe tener un solo un constructor que llama-
--remos Nota el cual toma dos par´ametros. El primer par´ametro es de tipo NotaBasica
-- <y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una
--nota alterada se puede usar como segundo par´ametro del constructor un Bemol o
--Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como
--segundo par´ametro

data NotaMusical = Nota NotaBasica Alteracion

--5.d) Defin´ı la funci´on sonidoCromatico :: NotaMusical -> Int que devuelve el sonido
--de una nota, incrementando en uno su valor si tiene la alteraci´on Sostenido, decre-
--mentando en uno si tiene la alteraci´on Bemol y dejando su valor intacto si la alteraci´on
--es Natural.

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota a Sostenido) = (sonidoNatural a) + 1
sonidoCromatico (Nota a Bemol) = (sonidoNatural a) - 1
sonidoCromatico (Nota a Natural) = (sonidoNatural a)

--5.e) Inclu´ı el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el
--mismo valor de sonidoCromatico se consideren iguales.

instance (Eq NotaMusical) where
a == b = sonidoCromatico a == sonidoCromatico b

--5.f ) Inclu´ı el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir
--que una nota es menor o igual a otra si y s´olo si el valor de sonidoCromatico para la
--primera es menor o igual al valor de sonidoCromatico para la segunda.

instance (Ord NotaMusical) where
a <= b = sonidoCromatico a <= sonidoCromatico b

--6.a) Definir la funci´on primerElemento que devuelve el primer elemento de una lista no
--vac´ıa, o Nothing si la lista es vac´ıa.

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:xs) = Just xs!!0

--7.a).1) definir la funcion atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que est´a
--en la primer posici´on de una cola, por haber sido atendida. Si la cola est´a vac´ıa,
--devuelve Nothing.

data Cola = VaciaC | Encolada Deportista Cola deriving (Show)

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada a b) = Just b

--7.a).2) definir la funcion encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola
--de deportistas, en la ´ultima posici´on

encolar :: Deportista -> Cola -> Cola
encolar n VaciaC = Encolada n VaciaC
encolar m (Encolada h c) = Encolada h (encolar m c)

--7.a).3) Definir la funcion busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera
--futbolista dentro de la cola que juega en la zona que se corresponde con el segundo
--par´ametro. Si no hay futbolistas jugando en esa zona devuelve Nothing.

busca :: Cola -> Zona -> Maybe Deportista --data Cola = VaciaC | Encolada Deportista Cola
busca VaciaC zona = Nothing
busca (Encolada (Futbolista h i j k) l) zona
        | futbo_encontrado zona n = Just n
        | otherwise = busca l zona
        where
        n = Futbolista h i j k
busca (Encolada n l) zona = busca c zona

--7.b) ¿A qu´e otro tipo se parece Cola?
--8)

data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b )

--8.a) ¿Como se debe instanciar el tipo ListaAsoc para representar la informaci´on almacenada
--en una gu´ıa telef´onica?

data Telefonos = ListaAsoc Int String

--8.b).1) la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una
--lista

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ xs) = 1 + la_long xs

--8.b).2) 

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia xs = xs
la_concat ys Vacia = ys
la_concat (Nodo a b xs) ys = Nodo a b (la_concat xs ys)

--8.b).3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que
--agrega un nodo a la lista de asociaciones si la clave no est´a en la lista, o actualiza
--el valor si la clave ya se encontraba.

la_agregar :: (Eq a) => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo a b xs) n m | (a == n) = (Nodo a m xs)
                             | (a /= n) = Nodo a b (la_agregar xs n m)

--8.b).4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asocia-
--ciones en una lista de pares clave-dato.

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b xs) = (a, b) : la_pares xs

--8.b).5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista
--y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve
--Nothing.

la_busca :: (Eq a) => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo a b xs) n | (a == n) = Just b
                         | (a /= n) = la_busca xs n


--8.b).6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada
--una clave a elimina la entrada en la lista.

la_borra :: (Eq a) => a -> ListaAsoc a b -> ListaAsoc a b
la_borra n Vacia = Vacia
la_borra n (Nodo a b xs) | n == a = xs
                         | n /= a = Nodo a b (la_borra n xs)