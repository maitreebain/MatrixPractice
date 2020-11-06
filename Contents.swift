import UIKit

func maxSquareOfOnes(matrix: [[Int]]) -> Int {
    matrix.enumerated().map { rowIndex, row in
        row.enumerated().map { columnIndex, number in
            maxSquareOfOnes(matrix: matrix, rowIndex: rowIndex, columnIndex: columnIndex)
        }
        .max()!
    }
    .max()!
}

func maxSquareOfOnes(matrix: [[Int]], rowIndex: Int, columnIndex: Int) -> Int {
    var count = 0
    for size in 0 ..< min(matrix.count - rowIndex, matrix.count - columnIndex) {
        if isSubmatrixAllOnes(matrix: matrix, fromRowIndex: rowIndex, toRowIndex: rowIndex+size, fromColumnIndex: columnIndex, toColumnIndex: columnIndex+size) {
            count += 1
        } else {
            break
        }
    }
    
    return count
}

func isSubmatrixAllOnes(matrix: [[Int]], fromRowIndex: Int, toRowIndex: Int, fromColumnIndex: Int, toColumnIndex: Int) -> Bool {
    matrix[fromRowIndex ... toRowIndex]
        .allSatisfy { row in
            row[fromColumnIndex ... toColumnIndex]
                .allSatisfy { $0 == 1 }
    }
}




//matrix([
//    [1,1,1],
//    [1,1,1],
//    [1,1,1]]) // 3
//
//matrix([[0,0,0],
//        [0,0,0],
//        [0,0,0]]) // 0
//
//matrix([[1,1,1],
//        [1,1,0],
//        [0,0,0]]) // 2

maxSquareOfOnes(matrix: [
[1,1,1],
[0,1,0],
[1,0,0]], rowIndex: 0, columnIndex: 0)

maxSquareOfOnes(matrix: [
    [1,1,1],
    [1,1,1],
    [1,1,1]]) // 3
//
maxSquareOfOnes(matrix: [
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1]])
//
maxSquareOfOnes(matrix: [[0,0,0],
        [0,0,0],
        [0,0,0]]) // 0

maxSquareOfOnes(
    matrix: [[1,1,1],
             [1,1,0],
             [0,0,0]]) // 2

maxSquareOfOnes(
    matrix: [
        [1, 1],
        [1, 0]
    ]
)

//isubs(matrix:
//[[1,1,1],
//[1,1,0],
//[0,0,0]], fromRowIndex: 1, toRowIndex: 2, fromColumnIndex: 1, toColumnIndex: 2)


//Matrix practice:

func sum(_ matrix: [[Int]]) -> Int{
    //return sum of matrix
    
    var num = 0
    
    for row in matrix {
        for column in row {
            num += column
        }
    }
    
    return num
}

sum([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

func sumRows(_ matrix: [[Int]]) -> [Int]{
    var sum = [Int]()
    
    for row in matrix {
        let item = row.reduce(0, +)
        sum.append(item)
    }
    
    return sum
}

sumRows([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) // [6, 15, 24]

func sumColumns(_ matrix: [[Int]]) -> [Int]{
    //enumerated on the arrays
    //array holds sum of each column
    
    let firstRow = matrix[0]
    
    return firstRow.indices.map { columnIndex -> Int in
        var temp = 0
        for row in matrix {
            temp += row[columnIndex]
        }
        return temp
    }
}

//for (rowIndex, row) in matrix.enumerated() { //0 1 2
//    for (index, column) in row.enumerated() { // [0 1 2]
//                                              //  [0 1 2]
//        //indicies of columns/numbers
//        //rowIndex is consistent
//        //if index == rowIndex
//        print("matrow\(rowIndex), \(row)")
//        print("\(index) col: \(column)")
//
//
//        print(temp)
//    }
//
//}

sumColumns([[1, 2, 3], //[0,0] [0,1] [0, 2]
            [4, 5, 6], //[1, 0] [1, 1], [1, 2]
            [7, 8, 9]]) //[2, 0] [2, 1] [2, 2]
// [12, 15, 18]

sumColumns([[1],
            [4, 5, 6],
            [7, 8, 9]]) // [12, 13, 15]


func sumDiagonals(_ matrix: [[Int]]) -> Int{
    var sum = 0
    
    for (rowIndex, row) in matrix.enumerated() {
        for (columnIndex, num) in row.enumerated() {
            
            if rowIndex == columnIndex {
                sum += num
            } else if row.count - 1 - rowIndex == columnIndex {
                sum += num
            }
        }
    }
    
    return sum
}


sumDiagonals([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
])


//func isSymmetric(_ matrix: [[Int]]) -> Bool  {
//
//    for row in matrix {
//        if row.reversed()
//    }
//
//}


//isSymmetric([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) // false
//isSymmetric([[1, 2, 3], [2, 5, 6], [3, 6, 9]]) // true


func flip(_ matrix: [[Int]]) -> [[Int]]{
    var flippedMatrix = matrix
    
    for rowIndex in matrix.indices {
        for columnIndex in matrix[rowIndex].indices {
            flippedMatrix[columnIndex][rowIndex] = matrix[rowIndex][columnIndex]
        }
    }
    
    return flippedMatrix
}


flip([
  [1, 2, 3],
  [4, 5, 6], //[1,0]
  [7, 8, 9]
])

// [ [1, 4, 7] //[0,1]
//   [2, 5, 8] //
//   [3, 6, 9] ]

func isSymmetric(_ matrix: [[Int]]) -> Bool {
    
    return flip(matrix) == matrix
}

isSymmetric([[1, 2, 3], [4, 5, 6], [7, 8, 9]]) // false
isSymmetric([[1, 2, 3], [2, 5, 6], [3, 6, 9]]) // true
