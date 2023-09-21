-- Ejercicio 2.a sum_cuad.xs
sum_cuad :: (Num a) => [a] -> a
sum_cuad [] = 0
sum_cuad (x:xs) = (x*x) + sum_cuad xs

-- Ejercicio 2.b iga.e.xs
iga_e :: (Num a, Eq a) => a -> [a] -> Bool
iga_e e [] = True
iga_e e (x:xs) = (x==e) && iga_e e xs 

-- Ejercicio 2.c exp.x.n
exp_x :: Int -> Int -> Int
exp_x x 0 = 1
exp_x x n = x * exp_x x (n-1)

-- Ejercicio 2.d sum_par.n
sum_par :: Int -> Int
sum_par 0 = 0
sum_par n | (n `mod` 2 == 0) = n + sum_par (n-1)
          | otherwise = sum_par (n-1)

-- Ejercicio 2.e cuantos.p.xs
cuantos_p :: (a -> Bool) -> [a] -> Int
cuantos_p p [] = 0
cuantos_p p (x:xs) | p x = 1 + cuantos_p p xs
                   | otherwise = cuantos_p p xs