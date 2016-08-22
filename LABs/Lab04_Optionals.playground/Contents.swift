// Lab04 - Optionals
import UIKit

// Task A - Closures Review - Convert the line below into a verbose and fully
// named function and then call it printing the result

var myNum = {$0*15/(sqrt($1)-10.5)}(10,5)

func myNumFunction(num1 num1:Float, num2:Float) -> Float{
    return num1*15/(sqrt(num2)-10.5)
}
let result: Float
result = myNumFunction(num1: 10, num2: 5)

// The fuction below takes an array and returns an optional "tuple"
// (yes you should know what a tuple is ... it was in the reading).  
// This tuple is an optional and will either be nil if the array cannot 
// be evenly split or it will return a tuple of arrays, with
// the first component being the first half of the array and the
// second with being the second half
func splitArray(theArray theArray: Array<Int>) -> (Array<Int>,Array<Int>)? {
    if theArray.count % 2 != 0 {
        return nil  // the array is not an even number of elements so it 
                    // cannot be split evenly
    }
    return (Array(theArray[0...theArray.count/2-1]),
            Array(theArray[theArray.count/2...theArray.count-1]))
}

let arrayTuple1 = splitArray(theArray: [1,2,3,4])
let arrayTuple2 = splitArray(theArray: [5,4,3,2,1])
let exampleArray = [1,2,3]

print("Example: \(exampleArray.description)")

// Task B - Convert the first component of the two tuple,
// arrayTuple1, to a string using the Array classes' .description property
// and print it (not as an optional) Note: a ".0" appended to the tuple  
// name  will access the first component of the tuple (e.g. arrayTuple1.0),
// see exampleArray above for use of the .description property
print(arrayTuple1!.0.description)


// Task C - print arrayTuple2's second component or an error message if
// arrayTuple2's second component is nil (not as an optional) this will 
// take more than a single line of code to do correctly.  Note: a ".1" will
// access the second component (e.g. arrayTuple2.1).  Test your code with
// an array that can be split and then one that cannont.
if let temp = arrayTuple2?.1{
    print(temp)
} else {
    print("ERROR: Second component is nil.")
}
if let temp = arrayTuple1?.1{
    print(temp)
} else {
    print("ERROR: Second component is nil.")
}


// If you finish you should start reading chapter 4 or for fun you can try 
// to load the cowboys image in the Resources folder of this playground


