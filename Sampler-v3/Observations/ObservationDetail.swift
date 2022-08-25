//
//  ObservationDetail.swift
//  Sampler-v3
//
//  Created by Darya Orlova on 8/24/22.
//

import SwiftUI

struct ObservationDetail: View {
    var observation: Observation
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading){
                Text("Time of the observation").bold()
                Text(observation.timestamp, formatter: itemFormatter)
                    .padding(.bottom)
                
                Text("Feeling").bold()
                Text(observation.feeling.rawValue)
                    .padding(.bottom)
                
                Text("Activity").bold()
                Text(observation.activity)
                    .padding(.bottom)
                
                Text("Company").bold()
                Text(observation.company)
                    .padding(.bottom)
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()


struct ObservationDetail_Previews: PreviewProvider {
    static var previews: some View {
        ObservationDetail(observation: Observation.default)
    }
}
