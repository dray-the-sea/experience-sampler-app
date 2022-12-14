//
//  ContentView.swift
//  Sampler-v3
//
//  Created by Darya Orlova on 8/24/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var draftNewObservation = Observation.default
    @State var addObservation = false
    @State private var showingProfile = false
    
    var body: some View {
        VStack{
            NavigationView {
                List{
                    ForEach(modelData.observations) { observation in
                        NavigationLink
                        {
                            ObservationDetail(observation: observation)
                        }
                    label:
                        {
                            Text(observation.timestamp, formatter: dateFormatter)
                            Text(observation.feeling.rawValue)
                            Text(String(observation.id))
                        }
                    }
                    
                    NavigationLink{
                        ObservationHost(newObservation: $draftNewObservation).onAppear{
                            draftNewObservation = Observation.default
                        }
                    } label: {
                        Label("Add an Observation", systemImage: "plus")
                    }
                    
                }.toolbar(){
                    
                    Button{
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                    
                    
                }
                .sheet(isPresented: $showingProfile){
                    ProfileHost()
                        .environmentObject(modelData)
                }
                .navigationTitle("Observations")
                
            }
        }.onAppear {
            print(FileManager.default.urls(
                for: .documentDirectory,
                   in: .userDomainMask))
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}


