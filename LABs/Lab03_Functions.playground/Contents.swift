// Lab03 Functions

import UIKit

// Allocate an Int array of 100 0's per step 2
var int_array = [Int]()
for i in 0...99{
    int_array.insert(0, atIndex: i)
}

// Use a for loop populate the array with random Int's
// between 1 and 100 per step 3
var rand_int_array = [Int]()
for i in 0...99{
    rand_int_array.insert(Int(arc4random_uniform(100)) + 1, atIndex: i)
}


// Declare a function per the requirements in step 4 of your
// lab
func incrementElements(array array: Array<Int>, increment_value: Int) -> Array<Int>{
    var temp_array = [Int]()
    temp_array.appendContentsOf(array)
    for i in 0...(temp_array.count - 1){
        temp_array[i] += increment_value
    }
    return temp_array
}


// Call your function step 4
var adjusted_array = [Int]()
adjusted_array = incrementElements(array: rand_int_array, increment_value: 3)
print(adjusted_array)

// Declare a function per the requirements in step 5 of your
// lab
func incrementElementsDirectly(inout array array: Array<Int>, increment_value: Int){
    for i in 0...(array.count - 1){
        array[i] += increment_value
    }
}


// Call your function from step 5
incrementElementsDirectly(array: &adjusted_array, increment_value: 2)
print(adjusted_array)

// Function to use in the Array.map() call
func addTwo(x:Int) -> Int {
    return x+2
}

// Call addTwo on the array from previous steps
adjusted_array = adjusted_array.map(addTwo)
print(adjusted_array)

// Call using anonymous function per step 7
adjusted_array = adjusted_array.map({(x:Int) -> Int in
    return x + 2
})
print(adjusted_array)

// Explain in a comment how we can get from the call you just created to the one below per step 8.
// If you would find it helpful you can replicate the process in the book for ommitting inferred
// syntax

// We can write a trailing closure to eliminate parenthesis and even shorten the call above
// nums = nums.map{$0+2}
adjusted_array = adjusted_array.map{$0+2}
print(adjusted_array)

//MY ANSWER: We can do nums = nums.map({$0+2}) because when we call the map function on the nums array, swift allows us to use $0 to refer to the first argument
//that was passed into the closure, which is in this case the element of the array. So then, we just add 2 to the element of the array by writing
//({$0+2}) in the closure. We can eliminate the parentheses to write {$0+2} because the swift compiler knows they're not necessary.