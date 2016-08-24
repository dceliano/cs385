//Lab05 - Class, Struct, Etc...

//Task A: In this task you will be creating an extension to the Int type in Swift.  This extension will make use of an enum that will serve to characterize an Int as either odd or even.  This characterization will be either an “O” if the digit is odd or an “E” if the digit is event
import UIKit
// Part 1 - Create an extension to the Int type.  At this point your extension will be empty.
extension Int{
    enum Sign: String{
        case Odd = "O", Even = "E"
    }
    var sign: Sign{
        switch self{
        case let x where x % 2 == 0:
            return .Even
        default:
            return .Odd
        }
    }
    func printSign(){
            print(self.sign.rawValue)
    }
}

10.printSign()

    // Part 2: Add an enumerated type called Sign to your extension.  This enum will have two cases, Odd and Even.  The rawValue of these two cases will be “O” and “E” respectively (see your reading on how to set the rawValue).

    //  Part 3:  Add a computed property to your extension,  name your computed property (a var) "sign".  Set “sign” to the correct “Sign” (the enum) based on the Int eg. if a 3 is passed in the function returns ".odd".  Again recall that inside an extension the Int is the instance of the Int() class referred to by “self”.

    // Part 4:  Add a function called printSign() to your extension that operates on an Int (remember an Int inside the extension to an Int is referred to by the keyword "self"), this function will print a string representing the sign of the Int (eg. 10.printSign() would print "E" to the console or var x = 23, x.printSign() would print "O" to the console) Note: Be sure to use your computed property "sign" eg. self.sign in your function.  You should also use the rawValue you assigned to your enum cases rather than a String literal like “O” in your output ...we shouldn’t see a “O” in your print call.

// Part 5:  Initialize an integer array of 5 odd and even values using an [Int] literal and then loop over the contents of this array using your printSign() exenstion to Int to print the sign of each of the elements

// Task B: Modify the struct, CustomIntArray, to conform to the protocol prettyPrinter below.
protocol PrettyPrinter {
    var stringRep : String {get}    // a computed property that is the string version of the Array
    var lengthRep : Int {get}       // a computed property representing the length of the string representation
}

struct CustomIntArray : PrettyPrinter {
    var data : [Int] = []
    var stringRep : String {        // you should fix the two computed properties so their implementation meets
        return ""                   // output show in write up
    }
    var lengthRep : Int {
        return 0
    }
}

// Part 1: Delcare a variable of type CustomIntArray and initilize it with an array of 4 integers print out the custom array's stringRep property and its lengthRep property

