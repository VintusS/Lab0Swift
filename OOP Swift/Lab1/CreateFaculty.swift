//
//  CreateFaculty.swift
//  Lab1 Swift
//
//  Created by Dragosh on 04.10.2023.
//

import Foundation

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
