//
//  ContentView.swift
//  BarChartAnimation
//
//  Created by Giannis Chatziveroglou on 6/20/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedPicker = 0
    @State var datapoints: [[CGFloat]] = [
        
        [150, 120, 64, 166, 176, 99, 65],
        [157, 31, 176, 100, 140, 127, 79],
        [34, 159, 103, 80, 128, 123, 104]
        
    ]
    
    var body: some View {
        ZStack{
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Calory Intake")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                
                Picker(selection: $selectedPicker, label: Text("")){
                    Text("Morning").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                HStack(spacing: 16){
                    BarView(intake: datapoints[selectedPicker][0], day: "M")
                    BarView(intake: datapoints[selectedPicker][1], day: "T")
                    BarView(intake: datapoints[selectedPicker][2], day: "W")
                    BarView(intake: datapoints[selectedPicker][3], day: "T")
                    BarView(intake: datapoints[selectedPicker][4], day: "F")
                    BarView(intake: datapoints[selectedPicker][5], day: "S")
                    BarView(intake: datapoints[selectedPicker][6], day: "S")
                }
                .padding(.top, 24)
                .animation(.default)
                
                
            }
            
        }
        
    }
}

struct BarView: View{
    
    var intake: CGFloat
    var day: String
    
    var body: some View{
        
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color("BarBackColor"))
                Capsule().frame(width: 30, height: intake)
                    .foregroundColor(.white)
            }
            
            Text(day).padding(.top, 8)
        }
        
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
