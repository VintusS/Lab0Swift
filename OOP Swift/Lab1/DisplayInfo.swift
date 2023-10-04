//
//  DisplayInfo.swift
//  Lab0 Swift
//
//  Created by Dragosh on 04.10.2023.
//

import Foundation

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

func displayEnrolledStudents() {
    print("Enter faculty abbreviation:")
    if let facultyAbbreviation = readLine(), let faculty = faculties[facultyAbbreviation] {
        if !faculty.students.isEmpty {
            print("Currently enrolled students in \(faculty.name):")
            for student in faculty.students {
                print("Name: \(student.firstName) \(student.lastName), Email: \(student.email), Student ID: \(student.studentID)")
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
                print("Name: \(student.firstName) \(student.lastName), Email: \(student.email), Student ID: \(student.studentID)")
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

