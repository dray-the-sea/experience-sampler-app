//
//  Observation.swift
//  KnowThyself
//
//  Created by Darya Orlova on 8/19/22.
//

import Foundation


struct Observation: Hashable, Codable, Identifiable {
    var id: Int
    var timestamp: Date
    var activity: String
    var feeling: Feeling
    var company: String
    
    
    static let `default` = Observation(
        id: -1,
        timestamp: Date(),
        activity: "",
        feeling: Feeling.na,
        company: "")
    
    enum Feeling: String, CaseIterable, Codable, Identifiable {
        case na = " "
        case angry = "Angry"
        case confused = "Confused"
        case energized = "Energized"
        case fine = "Fine"
        case frustrated = "Frustrated"
        case happy = "Happy"
        case hopeful = "Hopeful"
        case overwhelmed = "Overwhelmed"
        case sad = "Sad"
        case tired = "Tired"
        
        var id: String { rawValue }
    }
}
