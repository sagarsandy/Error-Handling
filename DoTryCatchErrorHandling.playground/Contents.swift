import UIKit




// Let's create simple function for checking height to enter imagica ride

func checkHeightForRide(height: Int) {
    
    if height > 8 {
        print("Dude you will end up with loosing your head")
        // Other code block
    } else if height < 4 {
        print("Dude you are not gonna complete this ride")
        // Rest of the code block
    } else {
        print("Good to go!! Enjoy the ride")
        // Other code block
    }
    
}

checkHeightForRide(height: 7)

// The above code block is a common function to check height, let's see how we can do this with "do catch"

// Error handling or using do catch block is another way of using else if statements.


// Do catch error handling with functions
// Part 1: First we need to design the error, so that others know that howmany cases of errors this function can throw
enum HeightError : Error {
    case maxHeight
    case minHeight
}

// Part 2: Creating function
func checkHeightForRideWithErrorHandling(height : Int) throws {
    
    if height > 8 {
        throw HeightError.maxHeight
    } else if height < 4 {
        throw HeightError.minHeight
    } else {
        print("Good to go!! Enjoy the ride")
    }
}

// Part 3: Handle the error

do {
    try checkHeightForRideWithErrorHandling(height: 30)
} catch HeightError.maxHeight {
    print("Dude you will end up with loosing your head")
} catch HeightError.minHeight {
    print("Dude you are not gonna complete this ride")
}

// So basically we are clearly indicating the error part, this is very simple and makes code very readability for other developers. Because we've clearly mentioned error part in the enums


// Do catch error handling with objects

enum NameError: Error {
    case noName
}

class Course {
    
    var name : String
    
    init(name: String) throws {
        
        if name == "" {
            throw NameError.noName
        } else {
           self.name = name
        }
    }
}

do {
    let myCourse = try Course(name: "Swift") // myCourse is not an optional object
} catch NameError.noName {
    print("Please include course name while initializing the course object")
}

// try?   and    try!

// If we are using try? it wll return a optional object

let myCourse1 = try? Course(name: "Obj C")  // myCourse1 is an optional object

// If we are sure about creating object without throwing any optional errors then use try!
let myCourse2 = try! Course(name: "Something!!") // myCourse2 is not an optional object








