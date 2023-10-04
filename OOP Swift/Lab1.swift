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
    var graduated: Bool
    
    init(firstName: String, lastName: String, email: String, enrollmentDate: Date, dateOfBirth: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.enrollmentDate = enrollmentDate
        self.dateOfBirth = dateOfBirth
        self.graduated = false
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

enum StudyField: String {
    case MECHANICAL_ENGINEERING
    case SOFTWARE_ENGINEERING
    case FOOD_TECHNOLOGY
    case URBANISM_ARCHITECTURE
    case VETERINARY_MEDICINE
}

var faculties: [String: Faculty] = [:]

func createFaculty() {
    print("Enter faculty name:")
    if let facultyName = readLine() {
        print("Enter faculty abbreviation:")
        if let facultyAbbreviation = readLine() {
            print("Choose study field:")
            print("1. Mechanical Engineering")
            print("2. Software Engineering")
            print("3. Food Technology")
            print("4. Urbanism Architecture")
            print("5. Veterinary Medicine")
            if let fieldChoice = readLine(), let fieldInt = Int(fieldChoice), let field = studyFieldFromInt(fieldInt) {
                let faculty = Faculty(name: facultyName, abbreviation: facultyAbbreviation, students: [], studyField: field)
                faculties[facultyAbbreviation] = faculty
                print("Faculty created successfully!")
            } else {
                print("Invalid field choice.")
            }
        }
    }
}

func studyFieldFromInt(_ value: Int) -> StudyField? {
    switch value {
    case 1: return .MECHANICAL_ENGINEERING
    case 2: return .SOFTWARE_ENGINEERING
    case 3: return .FOOD_TECHNOLOGY
    case 4: return .URBANISM_ARCHITECTURE
    case 5: return .VETERINARY_MEDICINE
    default: return nil
    }
}

func searchStudentAndShowFaculty() {
    print("Enter student email:")
    if let studentEmail = readLine() {
        for faculty in faculties.values {
            for student in faculty.students {
                if student.email == studentEmail {
                    print("\(student.firstName) \(student.lastName) belongs to \(faculty.name) faculty.")
                    return
                }
            }
        }
        print("Student with email \(studentEmail) not found.")
    }
}

func displayAllFaculties() {
    print("University faculties:")
    for faculty in faculties.values {
        print("Name: \(faculty.name), Abbreviation: \(faculty.abbreviation), Field: \(faculty.studyField.rawValue)")
    }
}

func displayFacultiesByField(field: StudyField) {
    print("Faculties in \(field.rawValue):")
    for faculty in faculties.values {
        if faculty.studyField == field {
            print("Name: \(faculty.name), Abbreviation: \(faculty.abbreviation)")
        }
    }
}

func createStudentAndAssignToFaculty() {
    print("Enter faculty abbreviation:")
    if let facultyAbbreviation = readLine(), let faculty = faculties[facultyAbbreviation] {
        print("Enter student first name:")
        if let firstName = readLine() {
            print("Enter student last name:")
            if let lastName = readLine() {
                print("Enter student email:")
                if let email = readLine() {
                    let student = Student(firstName: firstName, lastName: lastName, email: email, enrollmentDate: Date(day: 1, month: 1, year: 2023), dateOfBirth: Date(day: 1, month: 1, year: 2000))
                    
                    faculty.students.append(student)
                    
                    print("Student created and assigned to \(faculty.name) faculty.")
                } else {
                    print("Invalid input for student email.")
                }
            } else {
                print("Invalid input for student last name.")
            }
        } else {
            print("Invalid input for student first name.")
        }
    } else {
        print("Faculty not found.")
    }
}


func graduateStudentFromFaculty() {
    print("Enter faculty abbreviation:")
    if let facultyAbbreviation = readLine(), let faculty = faculties[facultyAbbreviation] {
        print("Enter student email:")
        if let studentEmail = readLine() {
            if let studentIndex = faculty.students.firstIndex(where: { $0.email == studentEmail }) {
                faculty.students[studentIndex].graduated = true
                print("Student with email \(studentEmail) graduated from \(faculty.name) faculty.")
            } else {
                print("Student not found in \(faculty.name) faculty.")
            }
        } else {
            print("Invalid input for student email.")
        }
    } else {
        print("Faculty not found.")
    }
}

func displayEnrolledStudents() {
    print("Enter faculty abbreviation:")
    if let facultyAbbreviation = readLine(), let faculty = faculties[facultyAbbreviation] {
        if !faculty.students.isEmpty {
            print("Currently enrolled students in \(faculty.name):")
            for student in faculty.students {
                print("Name: \(student.firstName) \(student.lastName), Email: \(student.email)")
            }
        } else {
            print("No enrolled students in \(faculty.name).")
        }
        
    } else {
        print("Faculty not found.")
    }
    print("Press Enter to return to the main menu")
    _ = readLine()
}

func displayGraduatedStudents() {
    print("Enter faculty abbreviation:")
    if let facultyAbbreviation = readLine(), let faculty = faculties[facultyAbbreviation] {
        let graduatedStudents = faculty.students.filter { student in
            return student.graduated
        }
        
        if !graduatedStudents.isEmpty {
            print("Graduated students from \(faculty.name):")
            for student in graduatedStudents {
                print("Name: \(student.firstName) \(student.lastName), Email: \(student.email)")
            }
        } else {
            print("No graduates from \(faculty.name).")
        }
        
    } else {
        print("Faculty not found.")
    }
    print("Press Enter to return to the main menu")
    _ = readLine()
}

func checkIfStudentBelongsToFaculty() {
    print("Enter faculty abbreviation:")
    if let facultyAbbreviation = readLine(), let faculty = faculties[facultyAbbreviation] {
        print("Enter student email:")
        if let studentEmail = readLine() {
            if faculty.students.contains(where: { $0.email == studentEmail }) {
                print("Student with email \(studentEmail) belongs to \(faculty.name) faculty.")
            } else {
                print("Student with email \(studentEmail) does not belong to \(faculty.name) faculty.")
            }
        } else {
            print("Invalid input for student email.")
        }
    } else {
        print("Faculty not found.")
    }
}

func createStudent() {
    print("Enter student first name:")
    if let firstName = readLine() {
        print("Enter student last name:")
        if let lastName = readLine() {
            print("Enter student email:")
            if let email = readLine() {
                print("Choose a faculty for the student:")
                for (index, faculty) in faculties.values.enumerated() {
                    print("\(index + 1). \(faculty.name)")
                }
                if let facultyChoice = readLine(), let facultyIndex = Int(facultyChoice) {
                    let facultyArray = Array(faculties.values)
                    if facultyIndex >= 1 && facultyIndex <= facultyArray.count {
                        let selectedFaculty = facultyArray[facultyIndex - 1]
                        
                        // Collect additional student information, e.g., date of birth, enrollment date
                        // Create a new student object
                        let student = Student(firstName: firstName, lastName: lastName, email: email, enrollmentDate: Date(day: 1, month: 1, year: 2023), dateOfBirth: Date(day: 1, month: 1, year: 2000))
                        
                        // Add the student to the selected faculty's students array
                        selectedFaculty.students.append(student)
                        
                        print("Student created successfully and assigned to \(selectedFaculty.name) faculty.")
                    } else {
                        print("Invalid faculty choice.")
                    }
                } else {
                    print("Invalid input for faculty choice.")
                }
            } else {
                print("Invalid input for student email.")
            }
        } else {
            print("Invalid input for student last name.")
        }
    } else {
        print("Invalid input for student first name.")
    }
}

func updateStudentInformation() {
    print("Enter student email to update:")
    if let studentEmail = readLine() {
        
        for (_, faculty) in faculties {
            if let studentIndex = faculty.students.firstIndex(where: { $0.email == studentEmail }) {
                var student = faculty.students[studentIndex]
                
                print("Enter updated first name (or press Enter to skip):")
                if let updatedFirstName = readLine(), !updatedFirstName.isEmpty {
                    student.firstName = updatedFirstName
                }
                
                print("Enter updated last name (or press Enter to skip):")
                if let updatedLastName = readLine(), !updatedLastName.isEmpty {
                    student.lastName = updatedLastName
                }
                
                print("Enter updated email (or press Enter to skip):")
                if let updatedEmail = readLine(), !updatedEmail.isEmpty {
                    student.email = updatedEmail
                }
                
                faculty.students[studentIndex] = student
                
                print("Student information updated successfully.")
                return
            }
        }
        print("Student with email \(studentEmail) not found.")
    } else {
        print("Invalid input for student email.")
    }
}



func mainScreen() {
    while true {
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
                    print("your input>", terminator: "")
                    if let choice = readLine() {
                        switch choice {
                        case "1":
                            createStudent()
                        case "2":
                            updateStudentInformation()
                        default:
                            print("Invalid choice.")
                        }
                    }
            case "q":
                print("Quitting...")
                exit(0)
            default:
                print("Unrecognized input: \(input)")
            }
        } else {
            print("Error reading input.")
        }
    }
}

func lab1() {
    mainScreen()
}

