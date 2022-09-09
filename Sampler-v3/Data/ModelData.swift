//
//  ModelData.swift
//  experience-sampler
//
//  Created by Darya Orlova on 8/16/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var observations: [Observation] = load(filename: "Observations.json")
    @Published var profile: Profile = Profile.default
    
    func save() {
    
        guard let dataURL = getURL() else {
            fatalError("Error retrieving URL where data should be saved. ")
        }
        do {
            
            let filepath = dataURL.appendingPathComponent("Observations.json")
            
            let data = try JSONEncoder().encode(observations)
            try data.write(to: filepath, options: .atomic)
        } catch {
            fatalError("Error writing to JSON file: \(error)")
        }
    }
    
    
}


func getURL() -> URL? {
    guard let documentsURL = FileManager.default.urls(
        for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
    return documentsURL
}


func load<T: Decodable>(filename: String) -> T{
    let data: Data
    
    guard let dataURL = getURL() else {
        fatalError("Error retrieving URL where data should be saved. ")
    }
    let filepath = dataURL.appendingPathComponent(filename)
    
    let fileManager = FileManager.default
    if !fileManager.fileExists(atPath: filepath.path) {
        
        do {
            let emptyArray: [Observation] = []
            let data = try JSONEncoder().encode(emptyArray)
            try data.write(to: filepath, options: .atomic)
        } catch {
            fatalError("Couldn't create a new Observations file")
        }
    }
    
    do {
        data = try Data(contentsOf: filepath)
        
    } catch {
        // if i change the contents of the Feeling enum, this will come into play. Fix later
        // TO DO: fix this later
        fatalError("Couldn't load contents of \(filename) from documents directory: \n \(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch
    {
        fatalError("Couldn't parse \(dataURL) as \(T.self): \n\(error) ")
    }
}
