//
//  ContentView.swift
//  CountDown
//
//  Created by Ang T on 2023-11-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            Text("Events")
                .font(.title)
                .fontWeight(.semibold)
            
            EventBannerView(EventName: "My Birthday", EventDate: "Feb 2", Time: 12)
            EventBannerView(EventName: "Anniversary", EventDate: "Aug 22", Time: 12)
            Spacer()
            Button{
                
            }label:{
                Text("Add Event")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(width:280,height:50)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EventBannerView: View{
    var EventName: String
    var EventDate: String
    var Time: Int
    var body: some View{
        LazyVGrid(columns: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Columns@*/[GridItem(.fixed(200))]/*@END_MENU_TOKEN@*/) {
            ZStack{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 350, height: 90)
                    .foregroundColor(.yellow)
                HStack{
                    VStack(alignment: .leading){
                        Text(EventName)
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding(.bottom,0.5)

                        Text(EventDate)
                            .foregroundColor(.black)
                            
                    }
                    Spacer()
                    Text(String(Time) + " hours")
                        .foregroundColor(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                }.padding()
                
            }
        }
    }
}
