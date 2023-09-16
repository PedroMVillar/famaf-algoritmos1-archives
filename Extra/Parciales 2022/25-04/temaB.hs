-- ╔════════════════════╗
-- |    Ejercicio 1     |
-- ╚════════════════════╝
data Palo = Espada | Basto | Oro | Copa
mismo_palo :: Palo -> Palo -> Bool
mismo_palo Espada Espada = True
mismo_palo Espada _ = False
mismo_palo Basto Basto = True
mismo_palo Basto _ = False
mismo_palo Oro Oro = True
mismo_palo Oro _ = False
mismo_palo Copa Copa = True
mismo_palo Copa _ = False

data Figura = Uno | Dos | Tres | Cuatro | Cinco | Seis | Siete | Sota | Caballo | Rey
valor_figura :: Figura -> Int
valor_figura Uno = 1
valor_figura Dos = 2
valor_figura Tres = 3
valor_figura Cuatro = 4
valor_figura Cinco = 5
valor_figura Seis = 6
valor_figura Siete = 7
valor_figura Sota = 8
valor_figura Caballo = 9
valor_figura Rey = 10

data Carta = Naipe Figura Palo
figura_carta :: Carta -> Figura
figura_carta (Naipe f _) = f
palo_carta :: Carta -> Palo
palo_carta (Naipe _ p) = p
suma_cartas :: Carta -> Carta -> Maybe Int
suma_cartas c1 c2
    | mismo_palo p1 p2 = Just (valor_figura (figura_carta c1) + valor_figura (figura_carta c2))  
    | otherwise = Nothing
    where
        p1 = palo_carta c1
        p2 = palo_carta c2
-- ╔════════════════════╗
-- |    Ejercicio 2     |
-- ╚════════════════════╝
compatibles :: Carta -> [Carta] -> [Figura]
compatibles c (x:xs) 
    | mismo_palo pc px && (vc + vx) <= 15 = fx : compatibles c xs
    | otherwise = compatibles c xs
    where 
        vc = valor_figura (figura_carta c)
        vx = valor_figura (figura_carta x)
        pc = palo_carta c
        px = palo_carta x
        fx = figura_carta x
-- ╔════════════════════╗
-- |    Ejercicio 3     |
-- ╚════════════════════╝

-- ╔════════════════════╗
-- |    Ejercicio 4     |
-- ╚════════════════════╝