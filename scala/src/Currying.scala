def curriedSum(x: Int)(y: Int) = x + y
val cs = curriedSum(3)_ // _ steht als Platzhalter fuer das ausgelassene Argument
println(cs(2))
