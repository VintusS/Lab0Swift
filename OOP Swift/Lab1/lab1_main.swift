//
//
//  Lab1 Swift
//
//  Created by Dragosh on 02.10.2023.
//

import Foundation

var faculties: [String: Faculty] = [:]
var programState: ProgramState? = .mainMenu

func lab1() {
    if let loadedData = SaveManager.loadData() {
            faculties = loadedData
        }

    while let _ = programState {
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
                programState = .generalOperations
            case "f":
                programState = .facultyOperations
            case "s":
                programState = .studentOperations
            case "q":
                SaveManager.saveData(faculties)
                print("Quitting...")
                programState = nil
                exit(0)
            default:
                print("Unrecognized input: \(input)")
            }
        } else {
            print("Error reading input.")
        }
    }
}


func performGeneralOperations() {
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
    print("your input>", terminator: "")
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
            if let fieldChoice = readLine(), let field = StudyField(rawValue: fieldChoice) {
                displayFacultiesByField(field: field)
            } else {
                print("Invalid field choice.")
            }
        default:
            print("Invalid choice.")
        }
    }
}
        
func performFacultyOperations() {
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
    print("your input>", terminator: "")
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
        default:
            print("Invalid choice.")
        }
    }
}
        
func performStudentOperations() {
    print("Student Operations")
    print("What do you want to do?")
    print()
    print("1 - Create a new student")
    print("2 - Update student information")
    print("3 - Search for a student by ID")
    print()
    print("b - Back")
    print("q - Quit Program")
    print()
    print("your input>", terminator: "")
    if let choice = readLine() {
        switch choice {
        case "1":
            createStudent()
        case "2":
            updateStudentInformation()
        case "3":
            searchStudentByID()
        default:
            print("Invalid choice.")
        }
    }
}
