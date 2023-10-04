//
//  SearchStudent.swift
//  Lab0 Swift
//
//  Created by Dragosh on 04.10.2023.
//

import Foundation

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
