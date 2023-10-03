//
// 
//  Lab1 Swift
//
//  Created by Dragosh on 02.10.2023.
//

import Foundation

class Date {
    var day: Int
    var month: Int
    var year: Int
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
}

class Student {
    var firstName: String
    var lastName: String
    var email: String
    var enrollmentDate: Date
    var dateOfBirth: Date
    init(firstName: String, lastName: String, email: String, enrollmentDate: Date, dateOfBirth: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.enrollmentDate = enrollmentDate
        self.dateOfBirth = dateOfBirth
    }
}

class Faculty {
    var name: String
    var abbreviation: String
    var students: [Student]
    var studyField: StudyField
    init(name: String, abbreviation: String, students: [Student], studyField: StudyField) {
        self.name = name
        self.abbreviation = abbreviation
        self.students = students
        self.studyField = studyField
    }
}

enum StudyField {
    case MECHANICAL_ENGINEERING
    case SOFTWARE_ENGINEERING
    case FOOD_TECHNOLOGY
    case URBANISM_ARCHITECTURE
    case VETERINARY_MEDICINE
}

func mainScreen() {
    print("Welcome to TUM's student management system!")
    print("What do you want to do?")
    print("g - General Operations")
    print("f - Faculty Operations")
    print("s - Student Operations")
    print()
    print("q - Quit Program")
    print()
    print("your input>", terminator: " ")
    if let input = readLine() {
        switch input {
            case "g":
                print("General Operations")
                print("What do you want to do?")
                print()
                print("nf/<faculty name>/<faculty abbreviation>/<field> - create faculty")
                print("ss/<student email> - search student and show faculty")
                print("df/<field> - display all faculties of a field")
                print()
                print("b - Back")
                print("q - Quit Program")
                print()
                print("your input>", terminator: "")
            case "f":
                print("Faculty Operations:")
                print("What do you want to do?")
                print()
                print("ns/<faculty abbreviation>/<first name>/<last name>/<email>/<day>/<month>/<year> - create student")
                print("gs/<email> - (g)raduate (s)tudent")
                print("ds/<faculty abbreviation> - (d)isplay enrolled (s)tudents")
                print("dg/<faculty abbreviation> - (d)isplay (g)raduated students")
                print("bf/<faculty abbreviation>/<email> - check if student (b)elongs to (f)aculty")
                print()
                print("b - Back")
                print("q - Quit Program")
                print()
                print("your input>", terminator: "")
            case "s":
                print("Student Operations:")
            case "q":
                print("Quiting...")
            default:
                // Handle unrecognized input
                print("Unrecognized input: \(input)")
        }
    } else {
        // Handle input error
        print("Error reading input.")
    }
}

func lab1() {
    mainScreen()
}
