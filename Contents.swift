import UIKit

func queens(n: Int) -> [[Int]] {
    
    guard n > 3 else {
        return [[Int]]()
    }
    
    func placeQueens(k: Int) -> [[Int]] {
        
        guard k > 0 else {
            return [[-1]]
            
        }
        var res = [[Int]]()
        
        for var q in placeQueens(k - 1) {
            
            if let first = q.first where first == -1 {
                q.removeAll()
            }
            
            for column in 1...n {
                
                if isSafe(column, queens: q) {
                    var solution = q
                    solution.append(column)
                    res.append(solution)
                }
            }
        }
        return res
    }
    return placeQueens(n)
}

func isSafe(column: Int, queens: [Int]) -> Bool {
    
    for (index, q) in queens.enumerate() {
        let dy = (index + 1) - (queens.count + 1)
        let dx = q - column
        let isDiagonal = dy * dy == dx * dx
        
        if q == column || isDiagonal {
            return false
        }
    }
    return true
}

//dibujar tabla

func drawTable(table: [Int]) -> String {
    var res = ""
    
    table.forEach {
        
        for column in 1...table.count {
            
            if $0 == column {
                res += "X "
            } else {
                res += ". "
            }
        }
        res += "\n"
    }
    return res
}
queens(4).forEach {
    print(drawTable($0))
}
