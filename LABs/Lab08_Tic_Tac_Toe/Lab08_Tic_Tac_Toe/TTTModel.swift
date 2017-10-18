//
//  main.swift
//  Lab07_Tic_Tac_Toe_Model
//
//  Created by Troy Weingart on 8/29/16.
//  Copyright © 2016 Troy Weingart. All rights reserved.
//

import Foundation


struct TTTModel : CustomStringConvertible {
    enum TTT : String {                 // enum that represents the "state" of a square on the
        case x = "X"                    // tic-tac-toe board
        case o = "O"
        case empty = "-"
        
        init() {
            self = TTT.empty
        }
    }
    
    // Task A: Determine the types of errors that the makeMove() function should throw and modify the enum below to reflect those errors.  You should be able to come up with 3 or 4.
    enum tttErr : ErrorType {
        case space_occupied //you tried to move where someone else is
        case bad_location //you didn't type in either 0, 1, or 2
        case board_full //we got to 10 turns (board is full)
    }
    
    var gameBoard = Array(count: 3, repeatedValue:                                      // 2D array of type TTT
        Array(count: 3, repeatedValue: TTT.empty))                                      // modeling the TTT board
    
    var whoTurn : TTT = .x                                                              // Who goes first
    
    var turnsTaken : Int = 0                                                            // The number of turns taken
    
    var description : String {                                                          // Because we adopt the Custom
        var strRep = "\n  0 1 2 \n"                                                       // StringConvertible protocol
        for (i,v) in gameBoard.enumerate() {                                            // we must have this property
            strRep += "\(i) \(v[0].rawValue) \(v[1].rawValue) \(v[2].rawValue)\n"       // it's a nice string representation
        }                                                                               // of our 2D array
        return strRep
    }
    
    // Task B:  Finish the makeMove() function so that it modifies the gameBoard array based on passed in parameters (whose attempting the move [turn] and a tuple representing the row/col of where the move is attempting to be made [location]).  You should also update the whoTurn and turnsTaken properties and test for and throw the errors from Task A.  Test your code prior to moving on to Task C.
    mutating func makeMove(turn turn : TTT, location: (Int,Int)) throws {
        turnsTaken += 1
        //error checking
        if(turnsTaken >= 10) { throw tttErr.board_full }
        if(!(location.0 == 0 || location.0 == 1 || location.0 == 2 || location.1 == 0 || location.1 == 1 || location.1 == 2)){ throw tttErr.bad_location }
        if(gameBoard[location.0][location.1] != .empty){ throw tttErr.space_occupied }
        //populating the board and switching turns
        else { gameBoard[location.0][location.1] = turn }
        if(turn == .x){ self.whoTurn = .o }
        else{ self.whoTurn = .x }
    }
    
    
    // Task C:  Finish the hasWon() function so that it returns TTT.x when "X" wins and TTT.o when "O" wins.  If there is currently no winner it will return nil ... which is why this fuction returns an optional.
    func hasWon() -> TTT? {
        //To do this, keep track of c0, c1, c2, r0, r1, r2, d0, and d1 for one of the letters. They all start at 0, and when you reach -3, O won, or +3, X won. We have to make an array for this.
        //The array is 8 numbers, where c0 is index 7 and d1 is index 0.
        var winArray = Array(count: 8, repeatedValue: 0)
        if(gameBoard[0][0] == .x){
            winArray[7] += 1
            winArray[4] += 1
            winArray[1] += 1
        }
        else if(gameBoard[0][0] == .o){
            winArray[7] -= 1
            winArray[4] -= 1
            winArray[1] -= 1
        }
        //8 more of these.
        if(gameBoard[0][1] == .x){
            winArray[6] += 1
            winArray[4] += 1
        }
        else if(gameBoard[0][1] == .o){
            winArray[6] -= 1
            winArray[4] -= 1
        }
        if(gameBoard[0][2] == .x){
            winArray[5] += 1
            winArray[4] += 1
            winArray[0] += 1
        }
        else if(gameBoard[0][2] == .o){
            winArray[5] -= 1
            winArray[4] -= 1
            winArray[0] -= 1
        }
        if(gameBoard[1][0] == .x){
            winArray[7] += 1
            winArray[3] += 1
        }
        else if(gameBoard[1][0] == .o){
            winArray[7] -= 1
            winArray[3] -= 1
        }
        if(gameBoard[1][1] == .x){
            winArray[6] += 1
            winArray[3] += 1
            winArray[0] += 1
            winArray[1] += 1
        }
        else if(gameBoard[1][1] == .o){
            winArray[6] -= 1
            winArray[3] -= 1
            winArray[0] -= 1
            winArray[1] -= 1
        }
        if(gameBoard[1][2] == .x){
            winArray[5] += 1
            winArray[3] += 1
        }
        else if(gameBoard[1][2] == .o){
            winArray[5] -= 1
            winArray[3] -= 1
        }
        if(gameBoard[2][0] == .x){
            winArray[7] += 1
            winArray[0] += 1
            winArray[2] += 1
        }
        else if(gameBoard[2][0] == .o){
            winArray[7] -= 1
            winArray[0] -= 1
            winArray[2] -= 1
        }
        if(gameBoard[2][1] == .x){
            winArray[6] += 1
            winArray[2] += 1
        }
        else if(gameBoard[2][1] == .o){
            winArray[6] -= 1
            winArray[2] -= 1
        }
        if(gameBoard[2][2] == .x){
            winArray[5] += 1
            winArray[2] += 1
            winArray[1] += 1
        }
        else if(gameBoard[2][2] == .o){
            winArray[5] -= 1
            winArray[2] -= 1
            winArray[1] -= 1
        }
        
        //going through the array looking for a winner
        for num in winArray{
            if(num == 3){
                return TTT.x
            }
            else if(num == -3){
                return TTT.o
            }
        }
        return nil
    }
    
    // Task D: Finish the reset() function so that it restores the properties of the TTTModel to their initial state.
    mutating func reset() {
        //make the entire gameBoard empty
        for row in 0...2{
            for column in 0...2{
                gameBoard[row][column] = .empty
            }
        }
        self.turnsTaken = 0 //reset the turns taken to 0
        self.whoTurn = .x //make X go first again
    }
    
}