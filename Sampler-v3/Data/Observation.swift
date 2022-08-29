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
        case alert = "Alert"
        case angry = "Angry"
        case ashamed = "Ashamed"
        case calm = "Calm"
        case conflicted = "Conflicted"
        case confused = "Confused"
        case curious = "Curious"
        case delighted = "Delighted"
        case disappointed = "Disappointed"
        case disgusted = "Disgusted"
        case emnarrassed = "Embarrased"
        case energized = "Energized"
        case excited = "Excited"
        case fearful = "Fearful"
        case focused = "Focused"
        case frustrated = "Frustrated"
        case guilty = "Guilty"
        case happy = "Happy"
        case healthy = "Healthy"
        case hopeful = "Hopeful"
        case neutral = "Neutral"
        case overwhelmed = "Overwhelmed"
        case sad = "Sad"
        case surprised = "Surprised"
        case trusting = "Trusting"
        case tired = "Tired"
        
        var id: String { rawValue }
    }
}
