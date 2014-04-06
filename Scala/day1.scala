class Board {
    val col1 = new Array[String](3)
    val col2 = new Array[String](3)
    val col3 = new Array[String](3)
    val grid = Array(col1, col2, col3)
    reset()
    
    def reset() = {
        grid.foreach { col =>
            col(0) = " "
            col(1) = " "
            col(2) = " "
        }
    }
    
    def mark(x: Int, y: Int, plyr: String) {
        grid(x)(y) = plyr
        println("Player " + plyr + " takes " + x + "," + y)
        display()
        println(result())
        println()
    }
    
    def display() = {
        for (row <- 2 to 0 by -1) {
            println(" " + grid(0)(row) + "|" + grid(1)(row) + "|" + grid(2)(row))
            if (row > 0) {
                println(" -----")
            }  
        }
    }
    
    def result(): String = {
        // check cols
        grid.foreach { col =>
            if (col(0) == col(1) && col(0) == col(2) && col(0) != " ") {
                return col(1) + " wins!"
            }
        }
        // check rows
        for(i <- 0 until 3) {
            if (grid(i)(0) == grid(i)(1) && grid(i)(0) == grid(i)(2) && grid(i)(0) != " ") {
                return grid(i)(0) + " wins!"
            }
        }
        // check diagonals
        if (grid(0)(0) == grid(1)(1) && grid(0)(0) == grid(2)(2) && grid(0)(0) != " ") {
            return grid(0)(0) + " wins!"
        }
        if (grid(0)(2) == grid(1)(1) && grid(0)(2) == grid(2)(0) && grid(0)(2) != " ") {
            return grid(0)(0) + " wins!"
        }
        // check for blanks
        grid.foreach { col =>
            col.foreach { cell =>
                if (cell == " ") {
                    return "Game unfinished"
                }
            }
        }
        return "Tie Game"
    }
}

// test out the board
val board = new Board()
board.mark(0,0,"X")
board.mark(2,0,"O")
board.mark(0,1,"X")
board.mark(1,1,"O")
board.mark(0,2,"X")

// test out the board again!
board.reset()
board.mark(0,0,"X")
board.mark(1,1,"O")
board.mark(0,1,"X")
board.mark(0,2,"O")
board.mark(1,0,"X")
board.mark(2,1,"O")
board.mark(2,2,"X")
board.mark(1,2,"O")
board.mark(2,0,"X")