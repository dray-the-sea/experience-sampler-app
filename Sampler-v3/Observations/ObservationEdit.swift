//
//  ObservationEdit.swift
//  Sampler-v3
//
//  Created by Darya Orlova on 8/25/22.
//

import SwiftUI

struct ObservationEdit: View {
    @Binding var observation: Observation
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("What are you feeling?").bold()
                Picker("Feeling", selection: $observation.feeling){
                    ForEach(Observation.Feeling.allCases){feeling in
                        Text(feeling.rawValue).tag(feeling)
                    }
                    .pickerStyle(.segmented)
                }
                
                .padding(.bottom)
                
                Text("What are you doing?").bold()
                TextField("Activity", text: $observation.activity)
                    .padding(.bottom)
                
                Text("Who are you with?").bold()
                TextField("Company", text: $observation.company)
                    .padding(.bottom)
                
            }
        }
    }
}

struct ObservationEdit_Previews: PreviewProvider {
    static var previews: some View {
        ObservationEdit(observation: .constant(Observation.default))
    }
}
