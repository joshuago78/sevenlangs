val stringList = List(
    "hello", //5
    "I'm Mr. Ed", //10
    "goodbye", //7
    "hello Dolly") //11

val totalStringSize = (0 /: stringList) {(sum, s) => sum + s.size}

println(totalStringSize) //33