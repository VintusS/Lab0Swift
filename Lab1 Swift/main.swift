//
//  main.swift
//  Lab1 Swift
//
//  Created by Dragosh on 25.09.2023.
//

enum StudyField {
    case MECHANICAL_ENGINEERING
    case SOFTWARE_ENGINEERING
    case FOOD_TECHNOLOGY
    case URBANISM_ARCHITECTURE
    case VETERINARY_MEDICINE
}

class Date {
    var Day: Int
    var Month: Int
    var Year: Int
    init(Day: Int, Month: Int, Year: Int) {
        self.Day = Day
        self.Month = Month
        self.Year = Year
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
    var students: [String]
    var studyField: StudyField
    init(name: String, abbreviation: String, students: [String], studyField: StudyField) {
        self.name = name
        self.abbreviation = abbreviation
        self.students = students
        self.studyField = studyField
    }
}
