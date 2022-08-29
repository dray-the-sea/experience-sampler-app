//
//  ModelData.swift
//  experience-sampler
//
//  Created by Darya Orlova on 8/16/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    
    @Published var observations: [Observation] = load()
 
    func save() {
      guard let dataURL = getURL() else {
          fatalError("Error retrieving URL where data should be saved. ")
      }
        do {
          let data = try JSONEncoder().encode(observations)
          try data.write(to: dataURL, options: .atomic)
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
  return documentsURL.appendingPathComponent("Observations.json")
}


func load<T: Decodable>() -> T{
    let data: Data
    
    guard let dataURL = getURL() else {
        fatalError("Error retrieving URL where data should be saved. ")
    }

    do {
      data = try Data(contentsOf: dataURL)
      
    } catch {
        fatalError("Couldn't load contents of \(dataURL) from main bundle: \n \(error)")
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

/*
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Couldn't load contents of \(filename) from main bundle: \n \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch
    {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error) ")
    }
}
 */

