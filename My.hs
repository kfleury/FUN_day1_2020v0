--
--
-- Hello
--
--
module My where

mySucc :: Int -> Int
mySucc = (+1)

myIsNeg :: Int -> Bool
myIsNeg nbr
  | nbr < 0 = True
  | otherwise = False

myAbs :: Int -> Int
myAbs abs
  | abs < 0 = -abs
  | otherwise = abs

myMin :: Int -> Int -> Int
myMin x y
  | x <= y = x
  | y < x = y

myMax :: Int -> Int -> Int
myMax x y
  | x >= y = x
  | y > x = y

myTuple :: a -> b -> (a, b)
myTuple a b = (a, b)

myTruple :: a -> b -> c -> (a, b, c)
myTruple a b c = (a, b, c)

myFst :: (a, b) -> a
myFst (a, _) = a

mySnd :: (a, b) -> b
mySnd (_, b) = b

mySwap :: (a, b) -> (b, a)
mySwap (a, b) = (b, a)

myHead :: [a] -> a
myHead [] = error "Can't call head on an empty list, dummy!"  
myHead (x:_) = x

myTail :: [a] -> [a]
myTail [] = error "Can't call tail on an empty list, dummy!"  
myTail (_:xs) = xs

myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs
-- myLength xs = sum[1 | _ <- xs]

myNth :: [a] -> Int -> a
myNth a i
  | i < 0 = error "The index is negative, give a positive number"
  | myLength a < i = error "The index is larger than the length of the list, give a minus number"
myNth (x:_) 0 = x
myNth (_:xs) i = myNth xs (i - 1)

myTake :: Int -> [a] -> [a]
myTake i _
  | i < 0 = error "The index is negative, give a positive number"  
myTake 0 _ = []
myTake _ [x] = [x]
myTake i (x:xs) = x:myTake (i - 1) xs

myDrop :: Int -> [a] -> [a]
myDrop i _
  | i < 0 = error "The index is negative, give a positive number"  
myDrop 0 a = a
myDrop _ [] = []
myDrop i (_:xs) = myDrop (i - 1) xs

myAppend :: [a] -> [a] -> [a]
myAppend a [] = a
myAppend [] b = b
myAppend (x:xs) b = x:myAppend xs b

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs++[x]

myInit :: [a] -> [a]
myInit [] = error "The list is empty"
myInit [x] = []
myInit (x:xs) = x:myInit xs

myLast :: [a] -> a
myLast [] = error "The list is empty"
myLast [x] = x
myLast (x:xs) = myLast xs

myZip :: [a] -> [b] -> [(a, b)]
myZip [] [] = []
myZip xs [] = []
myZip [] xs = []
myZip (x:xs) (y:ys) = (x, y):myZip xs ys

myUnzip :: [(a, b)] -> ([a], [b])
myUnzip [] = ([], [])
myUnzip ((a, b):xs) = (a:a', b:b')
  where (a', b') = myUnzip xs

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x:myMap f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter f (x:xs)
  | f x = x:rest
  | otherwise = rest
  where rest = myFilter f xs

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ b [] = b
myFoldl f b (x:xs) = myFoldl f (f b x) xs

myFoldr :: (b -> a -> b) -> b -> [a] -> b
myFoldr f b xs = myFoldl f b $ myReverse xs

mySpan :: (a -> Bool) -> [a] -> ([a], [a])
mySpan _ [] = ([], [])
mySpan f list@(x:xs)
  | f x = (x:a, a')
  | otherwise = ([], list)
  where (a, a') = mySpan f xs

myQuickSort :: (a -> a -> Bool) -> [a] -> [a]
myQuickSort _ [] = []
myQuickSort f (x:xs) = myAppend endL $ myAppend [x] endR
  where
    onRight = [ l | l <- xs, f x l]
    onLeft = [ l | l <- xs, not(f x l)]
    endR = myQuickSort f onRight
    endL = myQuickSort f onLeft
    
