; (load "/Users/vinacovre/Google Drive/Graduação/Unesp/LPNC/Lisp/part3.lisp")
;;; Recursion Exercises from Haskell to Lisp
; PART 3

; -- myMax [1, 7, 3, 17, 11]  >>> 17
; myMax :: Ord a => [a] -> a
; myMax xs = myMax' xs (head xs)
; myMax' [] a = a
; myMax' (x:xs) a = if x > a
;                 then myMax' xs x
;                 else myMax' xs a
;
;
; -- append [2, 6, 18, 54] [1, 3, 9, 18, 27, 81]  >>> [2, 6, 18, 54, 1, 3, 9, 18, 27, 81]
; append :: [a] -> [a] -> [a]
; append [] a = a
; append (x:xs) ys = x: append xs ys
;
; -- remq 'b' ['a', 'b', 'c', 'b', 'd', 'e' ] >>> ['a', 'c', 'd', 'e']
; remq :: Eq a => a -> [a] -> [a]
; remq y [] = []
; remq y (x:xs) = if y == x
;                 then remq y xs
;                 else x : remq y xs
;
; -- removeKFirst 'a' 2 ['x', 'y', 'a', 'z', 'w', 'a', 'f', 'g', 'a', 'p']  >>> ['x', 'y', 'z', 'w', 'f', 'g', 'a', 'p']
; removeKFirst :: Eq a => a -> Int -> [a] -> [a]
; removeKFirst _ k [] = []
; removeKFirst y k (x:xs) = if k == 0
;                           then (x:xs)
;                             else if x == y
;                               then removeKFirst y (k-1) xs
;                               else x : removeKFirst y k xs
;
; -- -- longest [[-1, 3], [10,11,12,13], [], [45,55]]  >>> [10, 11, 12, 13]
; -- longest :: [[a]] -> [a]
; -- longest [] [[]] = []
; -- longest x [[y:ys]] = if length' x > length' y
; --                      then longest x [[ys]]
; --                      else longest y [[ys]]
;
; -- firstOccurrence ['a', 'a', 'a', 'b', 'b', 'a', 'a', 'a', 'c', 'c']  >>> ['a', 'b', 'c']
; -- firstOccurrence [1,2,3,3,4,4,2,2,5] >>> [1,2,3,4,5] // [1,3,4,2,5]
; firstOccurrence :: Eq a => [a] -> [a]
; firstOccurrence [] = []
; firstOccurrence (x:xs) = if count x (x:xs) == 1
;                          then x : firstOccurrence xs
;                          else firstOccurrence xs
; -- not returning the list in the correct order! Use another logic...
;
; -- substitute 'c' 'd' ['a', 'c', 'c', 'e']  >>> ['a', 'd', 'd', 'e']
; substitute :: Eq a => a -> a -> [a] -> [a]
; substitute a b [] = []
; substitute a b (x:xs) = if x == a
;                         then b : substitute a b xs
;                         else x : substitute a b xs
;
; -- -- parlis [1, 2, 3] [11, 12, 13]  >>> [[1, 11], [2, 12], [3, 13]]
; -- pairlis :: [a] -> [a] -> [[a]]
; -- pairlis [] [] = []
; -- pairlis a [] = [a]
; -- pairlis (x:xs) (y:ys) = ((x:y) : pairlis xs ys)
;
; -- posPlus [7, 5, 1, 4]    >>> [7, 6, 3, 7]
; -- somar o elemento com sua posição
; -- Inicia n com 0
; posPlus :: Int -> [Int] -> [Int]
; posPlus _ [] = []
; posPlus n (x:xs) = (x+n) : posPlus (n+1) xs
