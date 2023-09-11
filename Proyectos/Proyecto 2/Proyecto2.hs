-- ◆═════════════════════════════════════════════●★●═════════════════════════════════════════════◆
{-En este proyecto nos introducimos en la definici ́on de nuestros propios tipos de datos. La 
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
-- a) Implementá los tipos Ingreso, Cargo, Area y Persona como est ́an definidos arriba
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar
data Area = Administrativa | Ensenanza | Economica | Postgrado
data Persona = Decane
           | Docente Cargo
           | NoDocente Area
           | Estudiante Carrera Ingreso
-- b) ¿Cuál es el tipo del constructor Docente?
-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 5

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 6

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 7

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 8

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --

-- ╔═══════════════════════════════════════════════════════════════════════════════════════════╗ --
-- ◇ Ejercicio 9

-- ╚═══════════════════════════════════════════════════════════════════════════════════════════╝ --