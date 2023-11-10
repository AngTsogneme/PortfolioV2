//
//  AddEventView.swift
//  CountDown
//
//  Created by Ang T on 2023-11-10.
//

import SwiftUI

struct AddEventView: View {
    @State var eventName: String
    var body: some View {
        VStack{
            TextField("Enter event name", text: $eventName)
                .padding(.leading, 10.0)
                .frame(width:300, height:50)
                .border(.yellow)
               
                

            Text(eventName)
        }
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView(eventName: "")
    }
}
