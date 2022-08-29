//
//  Sampler_v3App.swift
//  Sampler-v3
//
//  Created by Darya Orlova on 8/24/22.
//

import SwiftUI

@main
struct Sampler_v3App: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
