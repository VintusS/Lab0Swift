//
//  StudentManagement.swift
//  Lab1 Swift
//
//  Created by Dragosh on 04.10.2023.
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
