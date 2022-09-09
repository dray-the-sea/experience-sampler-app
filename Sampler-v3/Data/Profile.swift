//
//  UserProfile.swift
//  Sampler-v3
//
//  Created by Darya Orlova on 9/9/22.
//

import Foundation

struct Profile {
    var username: String
    var email: String
    var prefersNotifications: Bool
    
    static let `default` = Profile(
        username: "dray",
        email: "dray@the.sea",
        prefersNotifications: false
    )
    

    
}
