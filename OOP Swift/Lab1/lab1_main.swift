//
//
//  Lab1 Swift
//
//  Created by Dragosh on 02.10.2023.
//

import Foundation

var faculties: [String: Faculty] = [:]
var flag = true

func lab1() {
    while flag {
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
                // General Operations
                print("General Operations")
                print("What do you want to do?")
                print()
                print("1 - Create a new faculty")
                print("2 - Search what faculty a student belongs to by email")
                print("3 - Display University faculties")
                print("4 - Display all faculties belonging to a field")
                print()
                print("b - Back")
                print("q - Quit Program")
                print()
                print("your input>", terminator: " ")
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        createFaculty()
                    case "2":
                        searchStudentAndShowFaculty()
                    case "3":
                        displayAllFaculties()
                    case "4":
                        print("Choose a field:")
                        print("1. Mechanical Engineering")
                        print("2. Software Engineering")
                        print("3. Food Technology")
                        print("4. Urbanism Architecture")
                        print("5. Veterinary Medicine")

                        if let fieldChoice = readLine(), let fieldInt = Int(fieldChoice), let field = studyFieldFromInt(fieldInt) {
                            print("Faculties in \(field.rawValue):")
                            for faculty in faculties.values {
                                if faculty.studyField == field {
                                    print("Name: \(faculty.name), Abbreviation: \(faculty.abbreviation)")
                                }
                            }
                        } else {
                            print("Invalid field choice.")
                        }
                    case "b":
                        lab1()
                    case "q":
                        print("Quitting...")
                        flag = false
                        exit(0)
                    default:
                        print("Invalid choice.")
                    }
                }
                // Faculty Operations
                case "f":
                    print("Faculty Operations")
                    print("What do you want to do?")
                    print()
                    print("1 - Create a new student and assign to a faculty")
                    print("2 - Graduate a student from a faculty")
                    print("3 - Display current enrolled students (Graduates would be ignored)")
                    print("4 - Display graduates (Currently enrolled students would be ignored)")
                    print("5 - Tell if a student belongs to this faculty")
                    print()
                    print("b - Back")
                    print("q - Quit Program")
                    print()
                    print("your input>", terminator: " ")
                    if let choice = readLine() {
                        switch choice {
                        case "1":
                            createStudentAndAssignToFaculty()
                        case "2":
                            graduateStudentFromFaculty()
                        case "3":
                            displayEnrolledStudents()
                        case "4":
                            displayGraduatedStudents()
                        case "5":
                            checkIfStudentBelongsToFaculty()
                        case "b":
                            lab1()
                        case "q":
                            print("Quitting...")
                            flag = false
                            exit(0)
                            
                        default:
                            print("Invalid choice.")
                        }
                    }
                // Student Operations
                case "s":
                    print("Student Operations")
                    print("What do you want to do?")
                    print()
                    print("1 - Create a new student")
                    print("2 - Update student information")
                    print()
                    print("b - Back")
                    print("q - Quit Program")
                    print()
                    print("your input>", terminator: " ")
                    if let choice = readLine() {
                        switch choice {
                        case "1":
                            createStudent()
                        case "2":
                            updateStudentInformation()
                        case "b":
                            lab1()
                        case "q":
                            print("Quitting...")
                            flag = false
                            exit(0)
                        default:
                            print("Invalid choice.")
                        }
                    }
            case "q":
                print("Quitting...")
                flag = false
                exit(0)
            default:
                print("Unrecognized input: \(input)")
            }
        } else {
            print("Error reading input.")
        }
    }
}
