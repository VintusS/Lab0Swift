//
//  SaveManager.swift
//  Lab0 Swift
//
//  Created by Dragosh on 04.10.2023.
//

import Foundation

class SaveManager {
    static let saveFileName = "student_data.txt"

    static func saveData(_ faculties: [String: Faculty]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(faculties)
            try data.write(to: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(saveFileName))
            print("Data saved successfully.")
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }

    static func loadData() -> [String: Faculty]? {
        do {
            let data = try Data(contentsOf: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(saveFileName))
            let decoder = JSONDecoder()
            let loadedData = try decoder.decode([String: Faculty].self, from: data)
            print("Data loaded successfully.")
            return loadedData
        } catch {
            print("Error loading data: \(error.localizedDescription)")
            return nil
        }
    }
}
