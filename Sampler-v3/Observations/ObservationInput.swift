//
//  ObsrvationAdder.swift
//  Sampler-v3
//
//  Created by Darya Orlova on 8/24/22.
//

import SwiftUI

struct ObservationInput: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @Binding var newObservation: Observation
    
    var body: some View {
        
        VStack{
            HStack{
                
                if editMode?.wrappedValue == .inactive {
                    Button("Edit", action: {
                        if newObservation.id > -1 {
                            newObservation = modelData.observations[newObservation.id]
                        }
                        editMode?.animation().wrappedValue = .active
                    })
                }
                Spacer()
                
                if editMode?.wrappedValue == .active {
                    Button("Save", action:{
                        
                        newObservation.timestamp = Date()
                        if (newObservation.id == -1){
                            // this is a brand new incoming observation; current count should be the index of the incoming item.
                            newObservation.id = modelData.observations.count
                            
                            modelData.observations.append(newObservation)
                        }
                        else {
                            // this is an update of an observation
                            
                            modelData.observations[newObservation.id] = newObservation
                        }
                        
                        modelData.save()
                        
                        editMode?.animation().wrappedValue = .inactive
                    })
                }
            }
            
            
            Divider()
            
            if editMode?.wrappedValue == .active {
                ObservationEdit(observation: $newObservation)
            } else {
                ObservationDetail(observation: newObservation)
            }
            Spacer()
        }
    }
    
}

struct ObservationInput_Previews: PreviewProvider {
    static var previews: some View {
        ObservationInput(newObservation: .constant(Observation.default))
            .environmentObject(ModelData())
    }
}
