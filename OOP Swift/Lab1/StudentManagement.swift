//
//  StudentManagement.swift
//  Lab1 Swift
//
//  Created by Dragosh on 04.10.2023.
//

import Foundation

class Date: Codable {
    var day: Int
    var month: Int
    var year: Int
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
}

class Student: Codable {
    static var nextID: Int = 1
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
    var enrollmentDate: Date
    var dateOfBirth: Date
    var graduated: Bool

    public static var studentIDMap: [Int: Student] = [:]

    init(id: Int, firstName: String, lastName: String, email: String, enrollmentDate: Date, dateOfBirth: Date) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.enrollmentDate = enrollmentDate
        self.dateOfBirth = dateOfBirth
        self.graduated = false

        Student.studentIDMap[self.id] = self
    }

    static func findStudentByID(_ id: Int) -> Student? {
        return studentIDMap[id]
    }
    static func updateStudentInformation(id: Int, updatedFirstName: String?, updatedLastName: String?, updatedEmail: String?, updatedStudentID: Int? = nil) -> Bool {
            if var student = studentIDMap[id] {
                if let firstName = updatedFirstName, !firstName.isEmpty {
                    student.firstName = firstName
                }

                if let lastName = updatedLastName, !lastName.isEmpty {
                    student.lastName = lastName
                }

                if let email = updatedEmail, !email.isEmpty {
                    student.email = email
                }

                if let newStudentID = updatedStudentID {
                    if studentIDMap[newStudentID] == nil {
                        studentIDMap.removeValue(forKey: id)

                        student.id = newStudentID

                        studentIDMap[newStudentID] = student
                    } else {
                        return false
                    }
                }

                studentIDMap[id] = student
                return true
            }
            return false
        }
}




class Faculty: Codable {
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
    
    enum CodingKeys: String, CodingKey {
            case name
            case abbreviation
            case students
            case studyField
        }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        abbreviation = try container.decode(String.self, forKey: .abbreviation)
        students = try container.decode([Student].self, forKey: .students)
        studyField = try container.decode(StudyField.self, forKey: .studyField)
    }

}

enum StudyField: String, Codable {
    case MECHANICAL_ENGINEERING
    case SOFTWARE_ENGINEERING
    case FOOD_TECHNOLOGY
    case URBANISM_ARCHITECTURE
    case VETERINARY_MEDICINE
}

enum ProgramState {
    case mainMenu
    case generalOperations
    case facultyOperations
    case studentOperations
    case quit
}
